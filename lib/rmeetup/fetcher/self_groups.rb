module RMeetup
  module Fetcher
    class SelfGroups < Base
      MAX_API_VERSION = 3
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :groups
      end
      
      # Turn the result hash into a Group Class
      def format_result(result)
        RMeetup::Type::V3::Group.new(result)
      end

      def base_url
        'https://api.meetup.com/self/groups/'
      end
    end
  end
end