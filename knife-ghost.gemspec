# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "knife-ghost/version"

Gem::Specification.new do |s|
  s.name        = "knife-ghost"
  s.version     = Knife::Ghost::VERSION
  s.platform    = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE" ]
  s.authors     = ["Anthony Goddard"]
  s.email       = ["anthony@anthonygoddard.com"]
  s.homepage    = "https://github.com/agoddard/knife-ghost"
  s.summary     = %q{Chef Knife plugin to automatically populate local hosts file}
  s.description = %q{Automatically populates /etc/hosts with node domain names and IP addresses from Chef, requires sudo privileges to edit /etc/hosts}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "ghost", ">= 1.0.0"

end