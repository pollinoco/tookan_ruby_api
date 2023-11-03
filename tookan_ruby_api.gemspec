# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tookan/version"

Gem::Specification.new do |spec|
  spec.name          = "tookan_ruby_api"
  spec.version       = Tookan::VERSION
  spec.authors       = ["Luay Bseiso"]
  spec.email         = ["luay@buttercloud.com"]

  spec.summary       = %q{Tookan API Wrapper}
  spec.description   = %q{Tookan API Wrapper V2 API for good measure!}
  spec.homepage      = "http://buttercloud.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|bin|docs)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_dependency "faraday", "~> 1.1.0"
  spec.add_dependency "json", "~> 2.3"
end
