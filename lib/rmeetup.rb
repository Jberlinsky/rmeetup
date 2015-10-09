require 'net/http'
require 'date'
require 'rubygems'
require 'json'
require 'rmeetup/type'
require 'rmeetup/collection'
require 'rmeetup/fetcher'
require 'rmeetup/version'

module RMeetup

  # RMeetup Errors
  class NotConfiguredError < StandardError
    def initialize
      super "Please provide your Meetup API key before fetching data."
    end
  end

  class InvalidRequestTypeError < StandardError
    def initialize(type)
      super "Fetch type '#{type}' not a valid."
    end
  end

  # == RMeetup::Client
  #
  # Essentially a simple wrapper to delegate requests to
  # different fetcher classes who are responsible for fetching
  # and parsing their own responses.
  class Client
    FETCH_TYPES = [:topics, :cities, :members, :rsvps, :events, :groups, :comments, :photos, :categories]

    # Meetup API Key
    # Get one at http://www.meetup.com/meetup_api/key/
    # Needs to be the group organizers API Key
    # to be able to RSVP for other people
    @@api_key = nil
    def self.api_key; @@api_key; end;
    def self.api_key=(key); @@api_key = key; end;

    # requested Meetup API Version
    # If set, the gem will attempt to use this
    # version of the API. If not set, the maximum
    # version for any particular type will be used.
    @@api_version = nil
    def self.api_version; @@api_version; end;
    def self.api_version=(version); @@api_version = version; end;

    def self.fetch(type, options = {})
      check_configuration!

      # Merge in all the standard options
      # Keeping whatever was passed in
      options = default_options.merge(options)

      if FETCH_TYPES.include?(type.to_sym)
        # Get the custom fetcher used to manage options, api call to get a type of response
        fetcher = RMeetup::Fetcher.for(type, api_version)
        return fetcher.fetch(options)
      else
        raise InvalidRequestTypeError.new(type)
      end
    end

    protected
      def self.default_options
        {
          :key => api_key
        }
      end

      # Raise an error if RMeetup has not been
      # provided with an api key
      def self.check_configuration!
        raise NotConfiguredError.new unless api_key
      end
  end
end
