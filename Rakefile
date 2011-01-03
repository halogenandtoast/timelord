require 'rake'
require 'spec/rake/spectask'
require 'yaml'

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
end

task :default => [:test]
task :test => [:spec]

PKG_FILES = %w(Rakefile) + Dir.glob("{lib}/**/*")

gem_spec = Gem::Specification.new do |spec|
  spec.name = 'timelord'
  spec.version = '0.0.1'
  spec.summary = 'Pull dates out of strings'
  spec.description = 'Pull dates out of strings.'
  spec.email = 'halogenandtoast@gmail.com'
  spec.homepage = 'http://github.com/halogenandtoast/timelord'
  spec.authors = ['Matthew Mongeau']
  spec.files = PKG_FILES
end

desc "Generate a gemspec file"
task :gemspec do
  File.open("#{gem_spec.name}.gemspec", "w") do |f|
    f.write gem_spec.to_yaml
  end
end
