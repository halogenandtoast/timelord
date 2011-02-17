require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

specification = Gem::Specification.load("timelord.gemspec")

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
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
