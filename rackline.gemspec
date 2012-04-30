# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rackline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["MM"]
  gem.email         = ["masen@sutoroot.com"]
  gem.description   = %q{rackline}
  gem.summary       = %q{rackline}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rackline"
  gem.require_paths = ["lib"]
  gem.version       = Rackline::VERSION
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake','~> 0.9.2')
  gem.add_dependency('methadone', '~>1.0.0.rc4')
  gem.add_dependency('cloudservers')
  gem.add_dependency('parseconfig')
end
