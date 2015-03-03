# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tire/suggest_plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "tire-suggest_plugin"
  spec.version       = Tire::SuggestPlugin::VERSION
  spec.authors       = ["Dmitry Zhlobo"]
  spec.email         = ["dima.zhlobo@gmail.com"]
  spec.description   = "Addition for Tire to work with suggester plugin for elasticsearch"
  spec.summary       = "Addition for Tire to work with suggester plugin for elasticsearch"
  spec.homepage      = "https://github.com/twinslash/tire-suggest-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "tire", "~> 0.6.0"
end
