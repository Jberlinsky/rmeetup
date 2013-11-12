module RMeetup
  module Fetcher
    class Photos < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :photos
      end
      
      # Turn the result hash into a Photo Class
      def format_result(result)
        RMeetup::Type::V1::Photo.new(result)
      end
    end
  end
end