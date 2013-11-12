module RMeetup
  module Type
    class Base
      def initialize(obj = {})
        @obj = obj
      end

      def method_missing(id, *args)
        @obj[id.id2name]
      end
    end
  end
end