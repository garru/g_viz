# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{g_viz}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gary Tsang"]
  s.date = %q{2009-06-19}
  s.description = %q{Ruby Scribe Client. Package and Wrapper for generated ruby interfaces}
  s.email = %q{}
  s.extra_rdoc_files = ["CHANGELOG", "lib/g_viz/data.rb", "lib/g_viz/g_viz.rb", "lib/g_viz/json_google.rb", "lib/g_viz/templates/data_tables.erb", "lib/g_viz.rb", "README.markdown"]
  s.files = ["CHANGELOG", "lib/g_viz/data.rb", "lib/g_viz/g_viz.rb", "lib/g_viz/json_google.rb", "lib/g_viz/templates/data_tables.erb", "lib/g_viz.rb", "Manifest", "Rakefile", "README.markdown", "spec/g_viz/fixtures/annotated_timeline.rb", "spec/g_viz/g_viz_spec.rb", "spec/g_viz/templates/rendered_annotated_timeline.html", "spec/test_helper.rb", "g_viz.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/garru/GViz}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "G_viz", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{g_viz}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby Scribe Client. Package and Wrapper for generated ruby interfaces}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
