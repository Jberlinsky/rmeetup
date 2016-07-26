module RMeetup
  module Fetcher
    class ApiError < StandardError
      def initialize(error_message, request_url)
        super "Meetup API Error: #{error_message} - API URL: #{request_url}"
      end
    end

    class NoResponseError < StandardError
      def initialize
        super "No Response was returned from the Meetup API."
      end
    end
    
    # == RMeetup::Fetcher::Base
    # 
    # Base fetcher class that other fetchers 
    # will inherit from.
    class Base
      MAX_API_VERSION = nil
      MIN_API_VERSION = nil
      SINGULAR_RESOURCE = false
      def initialize(api_version = nil)
        @api_version = if api_version
           [api_version, self.class::MAX_API_VERSION].min if self.class::MAX_API_VERSION
        else
          # if self.class::MIN_API_VERSION
          #   self.class::MIN_API_VERSION
          # else
          #   self.class::MAX_API_VERSION
          # end
          self.class::MIN_API_VERSION ? self.class::MIN_API_VERSION : self.class::MAX_API_VERSION
        end
        @type = nil
      end
      
      # Fetch and parse a response
      # based on a set of options.
      # Override this method to ensure
      # neccessary options are passed
      # for the request.
      def fetch(options = {})
        url = build_url(options)

        response = get_response(url)
        json = response.body
        data = JSON.parse(json) rescue {}
        
        # Check to see if the api returned an error
        raise ApiError.new("Received no data, header was #{response.to_hash.inspect}", url) if data.is_a? Hash and data.empty?
        raise ApiError.new(data['details'],url) if data.is_a? Hash and data.has_key?('problem')

        collection = build_collection(data)
        
        # Format each result in the collection and return it
        if collection.is_a? Hash
          format_result(result)
        else
          collection.map!{|result| format_result(result)}
        end
      end


      def replace_url_params(url, options)
        url unless url.include?(':')

        options.each_key do |key|
          if url[":#{key}"]
            url[":#{key}"] = options[key].to_s
          end
        end

        url
      end

      def build_collection(data)
        if self.class::SINGULAR_RESOURCE
          data
        else
          RMeetup::Collection.build(data)
        end
      end

      protected
        # OVERRIDE this method to format a result section
        # as per Result type.
        # Takes a result in a collection and
        # formats it to be put back into the collection.
        def format_result(result)
          result
        end
      
        def build_url(options)
          url = replace_url_params(base_url, options)
          options = encode_options(options)
          check_url_for_missing_parameters!(url)
          
          url + params_for(options)
        end

      def check_url_for_missing_parameters!(url)
        test_match = url.match(/:\w+/)
        if test_match
          raise ApiError.new("Need to supply more urlparameters, missing are: #{test_match.to_a.join(', ')}", url)
        end
      end

      def base_url
          versioned_url = "#{@api_version}/" if @api_version.to_i > 1
          "https://api.meetup.com/#{versioned_url}#{@type}.json/"
        end
        
        # Create a query string from an options hash
        def params_for(options)
          params = []
          options.each do |key, value|
            params << "#{key}=#{value}"
          end
          "?#{params.join("&")}"
        end
        
        # Encode a hash of options to be used as request parameters
        def encode_options(options)
          options.each do |key,value|
            options[key] = URI.encode(value.to_s)
          end
        end
        
        def get_response(url)
          Net::HTTP.get_response(URI.parse(url)) || raise(NoResponseError.new)
        end
    end
  end
end