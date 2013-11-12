module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Topic
      #
      # Data wraper for a Topic fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this topic.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/topics/ for available fields
      
      class Topic < RMeetup::Type::Base
        
        def topic
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def id
          return topic['id'].to_i
        end
        def members
          return topic['members'].to_i
        end
        def updated
          return DateTime.parse(topic['updated'])
        end
      end
    end
  end
end