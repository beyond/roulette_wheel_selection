# -*- encoding: utf-8 -*-
require File.expand_path('../lib/roulette_wheel_selection/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Beyond"]
  gem.email         = ["beyond@be.to"]
  gem.description   = %q{ Hash#sample method is implemented with roulette wheel selection algorithm. Probability distribution is given by hash values. }
  gem.summary       = %q{ Hash#sample method implementation like Array#sample }
  gem.homepage      = "https://github.com/beyond/roulette_wheel_selection"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "roulette_wheel_selection"
  gem.require_paths = ["lib"]
  gem.version       = RouletteWheelSelection::VERSION

  gem.add_development_dependency "rspec"
end
