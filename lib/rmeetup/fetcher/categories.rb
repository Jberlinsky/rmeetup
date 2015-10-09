module RMeetup
  module Fetcher
    class Categories < Base
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :categories
      end
      
      # Turn the result hash into a Category Class
      def format_result(result)
        RMeetup::Type::V1::Category.new(result)
      end
    end
  end
end