require 'set'
require 'date'
class GViz
  @@viz_package_names = Set.new
  @@config = {}
  @@graphs = []
    
  class << self
    
    def output
      @@buffer = ""
    end

    def add_graph(type, data, mapping, options= {})
      @@viz_package_names.add(type)
      @@graphs << new(type, data, mapping, options)
    end
    
    def load_google_js
      api_key = @@config[:api_key].nil? ? "" : "?key=#{@@config[:api_key]}" 
      @@buffer << <<-SCRIPT
        <script type="text/javascript" src="http://www.google.com/jsapi#{api_key}"></script>
      SCRIPT
    end
    
    def load_packages
      @@buffer << <<-SCRIPT
        google.load('visualization', '1', {'packages':[#{@@viz_package_names.map{|p|p.downcase}.join(',')}]});  
      SCRIPT
    end
    
    def write_draw_function
      @@buffer << <<-SCRIPT
        google.setOnLoadCallback(drawChart);
        function drawChart() {
          var data = new google.visualization.DataTable();  
        
        }
      SCRIPT
    end
    
    
    
    def google_data_type(value)
      if value.is_a?(Numeric)
        data_type = 'numeric'
      elsif value.is_a?(Date)
        data_type = 'date'
      elsif value.is_a?(DateTime) || value.is_a?(Time)
        data_type = 'datetime'
      elsif value.respond_to?(:to_s)
        if !value.match(/[^0-9.]/)
          data_type = 'numeric'
        else
          if (a = Date._parse(value)).size >= 3 
            if a.size >= 5
              data_type = 'datetime'
            else
              data_type = 'date'
            end
          else
              data_type = 'string'
          end
        end
      end
      data_type
    end
  
    def ruby_to_js(type, value)
      if type == 'string'
        value = "'#{value}'"
      elsif type == 'date'
        value = Date.parse(value.to_s)
      elsif type == 'datetime'
        value = DateTime.parse(value.to_s)
      end
      return value
    end
  end

  def initialize(type, data, map, options = {})
    @type = type
    @map = map
    @data = data
    @data_type = {}
    @options = options
    import_data_types
  end
  
  def import_data_types
    first_row = @data.first
    puts first_row.inspect
    @map.each do |k, v|
      @data_type[k] = self.class.google_data_type(first_row[k])
    end
  end
  
  
  def columns
    first_row = @data.first
    data = @map.map do |k, v|
      [self.class.google_data_type(first_row[k]), v]
    end
  end
  
  def size
    @data.size
  end
  
  def rows
    @data.map do |value|
      @map.map do |k, v|
        self.class.ruby_to_js(@data_type[k], value[k])
      end
    end
  end
  
  
  
end