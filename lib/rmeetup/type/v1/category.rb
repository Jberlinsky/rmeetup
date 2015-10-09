module RMeetup
  module Type
    module V1
      
      # == RMeetup::Type::V1::Category
      #
      # Data wraper for a Category fethcing response
      # Used to access result attributes as well
      # as progammatically fetch relative data types
      # based on this group.
      
      class Category < RMeetup::Type::Base

        def category
          @obj
        end
        
        # Special accessors that need typecasting or other parsing

        def id
          return category['id'].to_i
        end
      end
    end
  end
end