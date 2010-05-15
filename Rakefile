require 'rubygems'
require 'bundler'

Bundler.setup(:default, :test)
require File.expand_path(File.join('..', 'lib', 'qblog'), __FILE__)
Bundler.require(:test)
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'lib/qblog/version'

GEM = "qblog"
GEM_VERSION = QBlog::VERSION
AUTHOR = ["Douglas Campos"]
EMAIL = [ "douglas@theros.info"]
HOMEPAGE = "http://github.com/qmx/qblog"
SUMMARY = "A gem that provides a sinatra blog"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary + ""
  s.authors = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  bundle = Bundler::Definition.from_gemfile("Gemfile")
  bundle.dependencies.
    select { |d| d.groups.include?(:runtime) }.
    each   { |d| s.add_dependency(d.name, d.version_requirements.to_s)  }

  s.require_path = 'lib'
  s.files = %w(LICENSE README.md Rakefile) + Dir.glob("{features,lib,spec}/**/*")
end
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

task :default => [:spec, :cucumber]

require 'spec/rake/spectask'
desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fp --color)

  t.rcov = true
  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
  t.rcov_opts << '--exclude' << '.gem,.rvm,.bundle,spec,examples'
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.libs << 'lib'
  t.cucumber_opts = "--format pretty"
  t.rcov = true
  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
  t.rcov_opts << '--exclude' << '.gem,.rvm,.bundle,spec,features,examples'
end
