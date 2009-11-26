# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{g_viz}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gary Tsang"]
  s.date = %q{2009-11-25}
  s.description = %q{Google Visualization API Ruby Client}
  s.email = %q{gary.tsang@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "Manifest",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "g_viz.gemspec",
     "lib/g_viz.rb",
     "lib/g_viz/data.rb",
     "lib/g_viz/g_viz.rb",
     "lib/g_viz/json_google.rb",
     "lib/g_viz/templates/data_tables.erb",
     "pkg/g_viz-0.0.3.gem",
     "spec/g_viz/fixtures/annotated_timeline.rb",
     "spec/g_viz/g_viz_spec.rb",
     "spec/g_viz/templates/rendered_annotated_timeline.html",
     "spec/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/JamieFlournoy/g_viz}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Google Visualization API Ruby Client}
  s.test_files = [
    "spec/g_viz/fixtures/annotated_timeline.rb",
     "spec/g_viz/g_viz_spec.rb",
     "spec/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
