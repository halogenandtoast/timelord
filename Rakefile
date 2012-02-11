require 'bundler'
require 'rdoc/task'
require 'rubygems/package_task'
require 'rspec/core/rake_task'

specification = Gem::Specification.load("timelord.gemspec")

RSpec::Core::RakeTask.new do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Timelord'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Gem::PackageTask.new(specification) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end

task :default => [:test]
task :test => [:spec]
