module RMeetup
  module Fetcher
    class Rsvps < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :rsvps
      end
      
      # Turn the result hash into a Rsvp Class
      def format_result(result)
        RMeetup::Type::V1::Rsvp.new(result)
      end
    end
  end
end