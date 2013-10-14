# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blockade/version'

Gem::Specification.new do |spec|
  spec.name          = "blockade"
  spec.version       = Blockade::VERSION
  spec.authors       = ["Zamith"]
  spec.email         = ["luis@zamith.pt"]
  spec.description   = %q{Controller level authorization}
  spec.summary       = %q{Controller level authorization}
  spec.homepage      = "https://github.com/zamith/blockade"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
