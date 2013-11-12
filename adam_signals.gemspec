# -*- encoding: utf-8 -*-
require File.expand_path('../lib/adam_signals/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "adam_signals"
  gem.authors       = ["Ben Langfeld"]
  gem.email         = ["ben@langfeld.me"]
  gem.description   = %q{Common message formats exchanged between Adam Snark Rabbit organs}
  gem.summary       = %q{Adam Snark Rabbit shared message formats}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = ["lib"]
  gem.version       = AdamSignals::VERSION

  gem.add_runtime_dependency 'virtus', '~> 1.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'coveralls'
end
