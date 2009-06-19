require 'rake'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "g_viz"
    gemspec.summary = "Google Visualization API Ruby Client"
    gemspec.email = "gary.tsang@gmail.com"
    gemspec.homepage = "http://github.com/garru/g_viz"
    gemspec.description = "Google Visualization API Ruby Client"
    gemspec.authors = ["Gary Tsang"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run all tests"
Spec::Rake::SpecTask.new  do |t|
  t.libs = [File.join(File.dirname(__FILE__), 'lib', 'g_viz')]
  t.fail_on_error = false
  t.spec_files = FileList['spec/*.rb']
end