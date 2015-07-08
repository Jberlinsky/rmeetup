module RMeetup
  module Fetcher
    class Events < Base
      MAX_API_VERSION = 2
      def initialize(api_version = nil)
        super(api_version)
        @type = :events
      end
      
      # Turn the result hash into a Event Class
      def format_result(result)
        if @api_version == 1
          RMeetup::Type::V1::Event.new(result)
        else
          RMeetup::Type::V2::Event.new(result)
        end
      end
    end
  end
end