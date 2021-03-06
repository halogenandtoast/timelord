# -*- encoding: utf-8 -*-

include_files = ["README*", "LICENSE", "Rakefile", "{lib,spec}/**/*"].map do |glob|
  Dir[glob]
end.flatten

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'timelord'

Gem::Specification.new do |s|
  s.name = "timelord"
  s.version = Timelord::VERSION
  s.authors = ["Matthew Mongeau"]
  s.email = "halogenandtoast@gmail.com"
  s.files = include_files
  s.homepage = "http://github.com/halogenandtoast/timelord"
  s.require_path = "lib"
  s.summary = "Pull dates out of strings"

  s.add_development_dependency "timecop"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
