module RMeetup
  module Fetcher
    class Groups < Base
      MAX_API_VERSION = 2
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :groups
      end
      
      # Turn the result hash into a Group Class
      def format_result(result)
        if @api_version == 1
          RMeetup::Type::V1::Group.new(result)
        else
          RMeetup::Type::V2::Group.new(result)
        end
      end
    end
  end
end