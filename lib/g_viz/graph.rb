module GViz
  class Graph
    attr_reader :type, :options

    def initialize(type, data, map, id = 0, options = {}, extra_options = {})
      @type = type
      @map = map
      @data = data
      @data_type = {}
      @options = options
      @extra_options = extra_options
      @id = id
      import_data_types
    end

    def chart_id
      return @type.downcase + @id.to_s
    end

    def data_name
      "data_#{@id}"
    end
    
  end
end