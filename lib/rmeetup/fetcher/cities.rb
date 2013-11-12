module RMeetup
  module Fetcher
    class Cities < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :cities
      end
      
      # Turn the result hash into a City Class
      def format_result(result)
        RMeetup::Type::V1::City.new(result)
      end
    end
  end
end