# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marooned/version'

Gem::Specification.new do |spec|
  spec.name          = "marooned"
  spec.version       = Marooned::VERSION
  spec.authors       = ["Keith Smiley"]
  spec.email         = ["keithbsmiley@gmail.com"]
  spec.summary       = "Find files stranded from Xcode"
  spec.description   = "Find source files that are not referenced from your Xcode project. Something that could happen after a merge conflict for example."
  spec.homepage      = "https://github.com/Keithbsmiley/marooned"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "xcodeproj", "~> 0.18"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
