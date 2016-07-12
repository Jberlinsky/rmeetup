module RMeetup
  module Fetcher
    class Groups < Base
      MAX_API_VERSION = 2
      MIN_API_VERSION = 1
      def initialize(api_version = nil)
        super(api_version)
        @type = :groups
      end
      
      # Turn the result hash into a Group Class
      def format_result(result)
        case @api_version
          when 1
            RMeetup::Type::V1::Group.new(result)
          when 2
            RMeetup::Type::V2::Group.new(result)
          else
            RMeetup::Type::V1::Group.new(result)
        end
      end
    end
  end
end