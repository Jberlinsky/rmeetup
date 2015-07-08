module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Rsvp
      #
      # Data wraper for a Rsvp fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this rsvp.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/ew/rsvps/ for available fields
      
      class Rsvp < RMeetup::Type::Base
        
        def rsvp
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def lat
          return rsvp['lat'].to_f
        end
        def lon
          return rsvp['lon'].to_f
        end
      end
    end
  end
end