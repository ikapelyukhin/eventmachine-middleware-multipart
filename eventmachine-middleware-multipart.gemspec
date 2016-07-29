# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: eventmachine-middleware-multipart 0.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "eventmachine-middleware-multipart"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ivan Kapelyukhin"]
  s.date = "2016-07-29"
  s.description = "This middleware for EM::HttpRequest adds support for multipart/form-data form encoding that is used mostly for file uploads."
  s.email = "ikapelyukhin@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/eventmachine-middleware-multipart.rb",
    "test/helper.rb",
    "test/test_eventmachine-middleware-multipart.rb"
  ]
  s.homepage = "http://github.com/kotato/eventmachine-middleware-multipart"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Multipart/form-data encoding support for EM::HttpRequest"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<em-http-request>, ["~> 1.1.2"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<em-http-request>, ["~> 1.1.2"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<em-http-request>, ["~> 1.1.2"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
