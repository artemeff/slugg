# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slugg/version'

Gem::Specification.new do |spec|
  spec.name          = "slugg"
  spec.version       = Slugg::VERSION
  spec.authors       = ["Yuri Artemev"]
  spec.email         = ["i@artemeff.com"]
  spec.description   = %q{Make safety urls from strings}
  spec.summary       = %q{Generates safe urls from strings}
  spec.homepage      = "https://github.com/artemeff/slugg"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
