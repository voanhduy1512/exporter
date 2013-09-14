# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exporter/version'

Gem::Specification.new do |spec|
  spec.name          = "exporter"
  spec.version       = Exporter::VERSION
  spec.authors       = ["Vo\xCC\x83 Anh Duy"]
  spec.email         = ["voanhduy1512@live.com"]
  spec.description   = %q{A simple gem for export data to other format}
  spec.summary       = %q{A simple data exporter}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
