require File.join(File.dirname(__FILE__), 'graph')  

module GViz
  class Base
  
    def initialize(config = {})
      @viz_package_names = Set.new
      @config = config
      @graphs = []
      @template_name = File.join(File.dirname(__FILE__), 'templates', 'visualization.erb')
    end

    def output
      b = binding
      rhtml = ERB.new(IO.read(@template_name), 0, "-")
      @output = rhtml.result(b) 
      return @output
    end

    def add_graph(type, data, mapping, options= {})
      @viz_package_names.add(type)
      new_graph = GViz::Graph.new(type, data, mapping, @graphs.size, options)
      @graphs << new_graph
      return new_graph.chart_id
    end
    
    def method_missing(name, *args)
      puts name
      if name.to_s.match(/add_/)
        type = name.to_s.gsub(/add_/){""}.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
        return add_graph(type, *args)
      else
        raise NoMethodError.new("Undefined method #{name} for #{self.inspect}")
      end
    end
  end
end