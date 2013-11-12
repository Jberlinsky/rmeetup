module RMeetup
  module Type
    module V1
    
      # == RMeetup::Type::V1::Photo
      #
      # Data wraper for a Photo fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this photo.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/photos/ for available fields
      
      class Photo < RMeetup::Type::Base
        
        def photo
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def created
          return DateTime.parse(photo['created'])
        end
      end
    end
  end
end