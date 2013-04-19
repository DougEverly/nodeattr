# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nodeattr/version'

Gem::Specification.new do |spec|
  spec.name          = "nodeattr"
  spec.version       = Nodeattr::VERSION
  spec.authors       = ["Doug Everly"]
  spec.email         = ["Doug@Everly.org"]
  spec.description   = %q{Ruby implementation of nodeattr}
  spec.summary       = %q{Ruby implementation of nodeattr that is included with libgenders. https://computing.llnl.gov/linux/genders.html}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
