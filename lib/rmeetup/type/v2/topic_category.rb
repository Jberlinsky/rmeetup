module RMeetup
  module Type
    module V2

      # == RMeetup::Type::V2::TopicCategory
      #
      # Data wrapper for a TopicCategory fetching response
      # Used to access result attributes as well
      # as programatically fetch relative data types
      # based on this event.
      
      # See http://www.meetup.com/de-DE/meetup_api/docs/2/topic_categories for available fields
      class TopicCategory < RMeetup::Type::Base
        def topic_category
          @obj
        end
      end
    end
  end
end
