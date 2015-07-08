module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Group
      #
      # Data wraper for a Group fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this group.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/groups/ for available fields
      
      class Group < RMeetup::Type::Base

        def group
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def id
          return group['id'].to_i
        end
        def updated
          return DateTime.parse(group['updated'])
        end
        def created
          return DateTime.parse(group['created'])
        end
        def lat
          return group['lat'].to_f
        end
        def lon
          return group['lon'].to_f
        end
        def daysleft
          return group['daysleft'].to_i
        end
      end
    end
  end
end