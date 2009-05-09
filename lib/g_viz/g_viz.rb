require File.join(File.dirname(__FILE__), 'data')
require File.join(File.dirname(__FILE__), 'visualization')  
require File.join(File.dirname(__FILE__), 'json_google')  

module GViz
  class Base
  
    def initialize(config = {})
      @viz_package_names = Set.new
      @config = config
      @datas = {}
      @visualizations = []
      @template_name = File.join(File.dirname(__FILE__), 'templates', 'data_tables.erb')
    end

    def output
      b = binding
      rhtml = ERB.new(IO.read(@template_name), 0, "-")
      @output = rhtml.result(b) 
      return @output
    end
    
    def add_data(data, mapping)
      @datas[data.object_id] = GViz::Data.new(data, mapping)
    end
    
    def add_graph(type, dom_id, data, columns, options= {}, extra_options = {})
      @viz_package_names.add(type)
      new_viz = draw_visualization(type, dom_id, data, columns, options, extra_options)
      @visualizations << new_viz
    end
    
    def draw_visualization(type, dom_id, data, columns, options = {}, extra_options = {})
      viz_string = <<-STRING
        var chart_#{data.object_id} = new google.visualization.#{type}(document.getElementById('#{dom_id}'));
        chart_#{data.object_id}.draw(createDataTable(#{@datas[data.object_id].data_name}, #{columns.to_json}), #{options.to_json});
      STRING
    end
    
    def method_missing(name, *args)
      if name.to_s.match(/add_/)
        type = name.to_s.gsub(/add_/){""}.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
        return add_graph(type, *args)
      else
        raise NoMethodError.new("Undefined method #{name} for #{self.inspect}")
      end
    end

  end
end