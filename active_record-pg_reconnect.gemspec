# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/pg_reconnect/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_record-pg_reconnect'
  spec.version       = ActiveRecord::PgReconnect::VERSION
  spec.authors       = ['Gabriel Naiman']
  spec.email         = ['gabynaiman@gmail.com']
  spec.summary       = 'Automatic reconnection for Postgres'
  spec.description   = 'Automatic reconnection for Postgres'
  spec.homepage      = 'https://github.com/gabynaiman/active_record-pg_reconnect'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'activerecord', '~> 4.2'
  spec.add_development_dependency 'pg', '~> 0.15'

  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'minitest', '~> 5.0', '< 5.11'
  spec.add_development_dependency 'minitest-colorin', '~> 0.1'
  spec.add_development_dependency 'minitest-line', '~> 0.6'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'pry-nav', '~> 0.2'
end
