# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "myhtml2haml/version"

Gem::Specification.new do |spec|
  spec.name          = "myhtml2haml"
  spec.version       = Myhtml2haml::VERSION
  spec.authors       = ["Vell"]
  spec.email         = ["lovell.mcilwain@gmail.com"]

  spec.summary       = %q{Convert html templates to haml templates}
  spec.description   = %q{An html2haml wrapper for converting html templates to haml templates}
  spec.homepage      = "https://github.com/vmcilwain/myhtml2haml"
  spec.license       = "MIT"
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir["{bin,lib}/**/*", "LICENSE.txt", "README.md", 'Rakefile', 'Gemfile', 'myhtml2haml.gemspec']
  spec.test_files    = Dir["spec/**/*"]
  spec.bindir        = "bin"
  spec.executables   = ['myhtml2haml']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'html2haml', '~> 2.2'
  spec.add_dependency 'thor', '~> 0.20'
end
