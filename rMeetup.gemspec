# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rmeetup/version'

Gem::Specification.new do |spec|
  spec.name          = "rMeetup"
  spec.version       = RMeetup::VERSION
  spec.authors       = ["Jason Berlinsky", "Liam Morley"]
  spec.email         = ["jason@jasonberlinsky.com", "liam@carpeliam.com"]
  spec.description   = %q{A simple Ruby gem, providing access to the Meetup API}
  spec.summary       = %q{A simple Ruby gem, providing access to the Meetup API}
  spec.homepage      = "https://github.com/Jberlinsky/rmeetup"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "json", "~> 1.8.2"
  spec.add_runtime_dependency "link_header"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
