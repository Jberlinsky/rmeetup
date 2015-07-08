# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
Gem::Specification.new do |s|
  s.name        = "rMeetup"
  s.version     = "1.0.1" 
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jared Pace", "Jason Berlinsky"]
  s.email       = ["jberlinsky@example.com"]
  s.homepage    = "https://github.com/Jberlinsky/rmeetup"
  s.summary     = "A simple Ruby gem, providing access to the Meetup API"
  #s.description = ""
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("lib/**/*") 
  s.require_path = 'lib'
end
