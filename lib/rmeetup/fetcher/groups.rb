module RMeetup
  module Fetcher
    class Groups < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :groups
      end
      
      # Turn the result hash into a Group Class
      def format_result(result)
        RMeetup::Type::V1::Group.new(result)
      end
    end
  end
end