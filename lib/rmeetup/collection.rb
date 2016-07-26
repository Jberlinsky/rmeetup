module RMeetup
  class Collection < Array
    attr_accessor :page_size, :total_results, :raw_meta
    attr_writer   :current_page
    
    def self.build(response)
      collection = Collection.new()
      
      # Setup the attributes needed for WillPaginate style paging
      request_url = response['meta']['url']
      request_parameters = parse_parameters_from_url(request_url)
      collection.page_size = request_parameters['page'] ? request_parameters['page'].to_i : nil
      collection.total_results = response['meta']['total_count'].to_i
      collection.current_page = request_parameters['offset'] ? (request_parameters['offset'].to_i + 1) : 1
      collection.raw_meta = response['meta']
      
      # Load the collection with all
      # of the results we passed in
      response['results'].each do |result|
        collection << result
      end
      
      collection
    end
    
    # = WillPaginate Helper Methods
    #
    # These methods are implementded so that
    # you may pass this collection to the will_paginate
    # view helper to render pagination links.
    def current_page
      @current_page
    end
    
    def total_pages
      @page_size ? (@total_results.to_f / @page_size.to_f).ceil : 1
    end
    
    def previous_page
      self.current_page == 1 ? nil : self.current_page.to_i-1
    end
    
    def next_page
      self.current_page == self.total_pages ? nil : self.current_page.to_i+1
    end
    
    protected
      def self.parse_parameters_from_url(url)
        query = URI.parse(url).query
        parameters = {}
        
        query.split("&").each do |kv|
          kv = kv.split("=")
          parameters[kv[0]] = kv[1]
        end
        parameters
      end
  end
end