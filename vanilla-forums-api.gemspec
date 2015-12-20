require File.expand_path('../lib/vanilla-forums-api/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'vanilla-forums-api'
  s.version     = VanillaForumsAPI::VERSION.dup
  s.date        = '2015-12-21'
  s.summary     = "Ruby client library for Vanillaforums APIs"
  s.description = "Connect Ruby applications with the Vanilla forums Platform"
  s.authors     = ["Christian Orthmann"]
  s.email       = 'christian.orthmann@gmail.com'
  s.require_path = 'lib'
  s.files       = `git ls-files`.split("\n") - %w(.rvmrc .gitignore)
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n") - %w(.rvmrc .gitignore)
  s.homepage    = 'http://rubygems.org/gems/vanilla-forums-api'
  s.license     = 'MIT'

  s.add_development_dependency('rake', '~> 10')
  s.add_development_dependency('rspec', '~> 3')
  s.add_development_dependency('webmock', '~> 1')
  s.add_development_dependency('simplecov', '~> 0')
  s.add_development_dependency('simplecov-rcov', '~> 0')
  s.add_development_dependency('yard', '~> 0')
  s.add_runtime_dependency('faraday', '~> 0')
  s.add_runtime_dependency('faraday_middleware', '~> 0')
end
