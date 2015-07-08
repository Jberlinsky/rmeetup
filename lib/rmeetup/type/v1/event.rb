module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Event
      #
      # Data wraper for a Event fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this event.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/events/ for available fields

      class Event < RMeetup::Type::Base

        def event
          @obj
        end

        # Special accessors that need typecasting or other parsing
        def id
          event['id'].to_i
        end
        def lat
          event['lat'].to_f
        end
        def lon
          event['lon'].to_f
        end
        def rsvpcount
          event['rsvpcount'].to_i
        end
        def updated
          DateTime.parse(event['updated'])
        end
        def time
          DateTime.parse(event['time'])
        end
      end
    end
  end
end