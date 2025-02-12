# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "active_uuid/version"

Gem::Specification.new do |s|
  s.name        = "activeuuid"
  s.version     = Activeuuid::VERSION
  s.authors     = ["Nate Murray"]
  s.email       = ["nate@natemurray.com"]
  s.homepage    = "https://github.com/jashmenn/activeuuid"
  s.summary     = "Add binary UUIDs to ActiveRecord in MySQL"
  s.description = "Add binary (not string) UUIDs to ActiveRecord in MySQL"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activesupport"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "fabrication"
  s.add_development_dependency "forgery"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 3.5"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "solid_assert", "~> 1.0"

  if RUBY_ENGINE == "jruby"
    s.add_development_dependency "activerecord-jdbcmysql-adapter"
    s.add_development_dependency "activerecord-jdbcpostgresql-adapter"
    s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  else
    s.add_development_dependency "mysql2"
    s.add_development_dependency "pg"
    s.add_development_dependency "sqlite3", "~> 1.3.6"
  end

  s.add_runtime_dependency "activerecord", ">= 5.0"
  s.add_runtime_dependency "uuidtools"
end
