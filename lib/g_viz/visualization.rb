module GViz
  class Visualization
    attr_reader :type, :options

    def initialize(type, data, map, options = {}, extra_options = {})
      @type = type
      @data = data
      @map = map
      @options = options
      @extra_options = extra_options
    end
    
  end
end