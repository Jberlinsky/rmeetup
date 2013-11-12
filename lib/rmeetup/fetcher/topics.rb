module RMeetup
  module Fetcher
    class Topics < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :topics
      end
      
      # Turn the result hash into a Topic Class
      def format_result(result)
        RMeetup::Type::V1::Topic.new(result)
      end
    end
  end
end