module RMeetup
  module Type
    module V1
    
      # == RMeetup::Type::V1::Member
      #
      # Data wraper for a Member fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this member.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/members/ for available fields
      
      class Member < RMeetup::Type::Base

        def member
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def id
          return member['id'].to_i
        end
        def lat
          return member['lat'].to_f
        end
        def lon
          return member['lon'].to_f
        end
      end
    end
  end
end