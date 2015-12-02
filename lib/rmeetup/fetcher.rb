require "rmeetup/fetcher/base"
require "rmeetup/fetcher/topics"
require "rmeetup/fetcher/cities"
require "rmeetup/fetcher/members"
require "rmeetup/fetcher/rsvps"
require "rmeetup/fetcher/events"
require "rmeetup/fetcher/groups"
require "rmeetup/fetcher/comments"
require "rmeetup/fetcher/photos"
require "rmeetup/fetcher/categories"

module RMeetup
  module Fetcher
    
    class << self
      # Return a fetcher for given type/API version
      def for(type, api_version = nil)
        return  case type.to_sym
                when :topics
                  Topics.new(api_version)
                when :cities      
                  Cities.new(api_version)
                when :members     
                  Members.new(api_version)
                when :rsvps       
                  Rsvps.new(api_version)
                when :events      
                  Events.new(api_version)
                when :groups      
                  Groups.new(api_version)
                when :comments    
                  Comments.new(api_version)
                when :photos
                  Photos.new(api_version)
                when :categories
                  Categories.new(api_version)
                end
      end 
    end
  end
end