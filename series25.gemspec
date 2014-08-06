# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'series25/version'

Gem::Specification.new do |spec|
  spec.name          = "series25"
  spec.version       = Series25::VERSION
  spec.authors       = ["James Kerr"]
  spec.email         = ["jkerr838@gmail.com"]
  spec.summary       = %q{A Ruby client wrapper for CollegeNet's Series25 Web Services.}
  spec.description   = %q{This gem provides an interface that interacts with a existing Web Services installation.}
  spec.homepage      = "https://github.com/chapmanu/series25"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
