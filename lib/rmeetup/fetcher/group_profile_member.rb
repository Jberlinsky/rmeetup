module RMeetup
  module Fetcher
    class GroupProfileMember < Base
      MAX_API_VERSION = 3
      MIN_API_VERSION = 3
      SINGULAR_RESOURCE = true
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = 'group/members/member_id'
      end
      
      # Turn the result hash into a Group Class
      def format_result(result)
        RMeetup::Type::V3::GroupProfile.new(result)
      end

      def base_url
        'https://api.meetup.com/:urlname/members/:member_id'
      end
    end
  end
end