module RMeetup
  module Fetcher
    class TopicCategories < Base
      MIN_API_VERSION = 2
      MAX_API_VERSION = 2
      def initialize(api_version = nil)
        super(api_version) # no support for API versioning yet
        @type = :topic_categories
      end
      
      # Turn the result hash into a Topic Class
      def format_result(result)
        RMeetup::Type::V2::TopicCategory.new(result)
      end
    end
  end
end