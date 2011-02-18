require 'rake'
require 'rspec/core/rake_task'
require 'rake/rdoctask'
require 'rake/gempackagetask'

specification = Gem::Specification.load("timelord.gemspec")

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--color', '--format progress']
  t.pattern = 'spec/**/*_spec.rb'
end

Rake::GemPackageTask.new(specification) do |package|
  package.need_zip = true
  package.need_tar = true
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Timelord'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => [:test]
task :test => [:spec]
