require 'rubygems'
require File.join(File.dirname(__FILE__), '..', 'lib', 'g_viz', 'g_viz')

class TestHelper
  def self.template(name)
    f = File.open(File.join(File.dirname(__FILE__), 'g_viz', 'templates', "#{name}.html"))
    d = f.readlines(nil)
    return d[0].to_s
  end
end
