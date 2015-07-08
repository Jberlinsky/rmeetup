module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Comment
      #
      # Data wraper for a Comment fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this comment.
      
      # Edited by Jason Berlinsky on 1/20/11 to allow for arbitrary data access
      # See http://www.meetup.com/meetup_api/docs/ew/comment/ for available fields
      
      class Comment < RMeetup::Type::Base
        
        def comment
          @obj
        end
        
        # Special accessors that need typecasting or other parsing
        
        def rating
          return comment['rating'].to_i
        end
        def created
          return DateTime.parse(comment['created'])
        end
        def lat
          return comment['lat'].to_f
        end
        def lon
          return comment['lon'].to_f
        end
      end
    end
  end
end