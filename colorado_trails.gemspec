
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "colorado_trails/version"

Gem::Specification.new do |spec|
  spec.name          = "colorado_trails"
  spec.version       = ColoradoTrails::VERSION
  spec.authors       = ["ChrstphGrnr"]
  spec.email         = ["46858206+ChrstphGrnr@users.noreply.github.com"]

  spec.summary       = "Colorado Trails Gem"
  spec.description   = "Developed for access to Colorado's Top 20 trails in a variety of categories."
  spec.homepage      = "https://github.com/ChrstphGrnr/colorado_trails.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://rubygems.org"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "https://github.com/ChrstphGrnr/colorado_trails"
    
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'nokogiri'
  
  spec.add_dependency 'colorize'
  spec.add_dependency 'artii'

  
  
end
