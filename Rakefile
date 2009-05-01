require 'echoe'
require 'rake'
require 'spec/rake/spectask'

Echoe.new('g_viz') do |p|
  p.project = 'g_viz'
  p.author = 'Gary Tsang'
  p.summary = '	Ruby Scribe Client. Package and Wrapper for generated ruby interfaces'
  p.url = 'http://github.com/garru/GViz'
  p.development_dependencies = []
end


desc "Run all tests"
Spec::Rake::SpecTask.new  do |t|
  t.libs = [File.join(File.dirname(__FILE__), 'lib', 'g_viz')]
  t.fail_on_error = false
  t.spec_files = FileList['specs/*.rb']
end