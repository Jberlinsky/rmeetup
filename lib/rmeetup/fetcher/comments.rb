module RMeetup
  module Fetcher
    class Comments < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :comments
      end
      
      # Turn the result hash into a Comment Class
      def format_result(result)
        RMeetup::Type::V1::Comment.new(result)
      end
    end
  end
end