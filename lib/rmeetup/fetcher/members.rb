module RMeetup
  module Fetcher
    class Members < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :members
      end
      
      # Turn the result hash into a Member Class
      def format_result(result)
        RMeetup::Type::V1::Member.new(result)
      end
    end
  end
end