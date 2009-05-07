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

    def import_data_types
      not_all_data_types_found = true
      find_data_types = @map.dup

      @data.each do |x|
        break if find_data_types.size == 0
        find_data_types.each do |k, v|
          if x[k]
            @data_type[k] = self.class.google_data_type(x[k]) 
            find_data_types.delete([k,v])
          end
        end
      end

      # if there is no data that responds to a mapped value, remove that mapping
      @map -= find_data_types  
    end

    def columns
      data = @map.map do |k, v|
        [@data_type[k], v]
      end
    end

    def size
      @data.size
    end

    def rows
      @data.map do |value|
        @map.map do |k, v|
          self.class.ruby_to_js(@data_type[k], value[k], @extra_options['prune'])
        end
      end
    end

    def chart_id
      return @type.downcase + @id.to_s
    end

    def data_name
      "data_#{@id}"
    end
    
    class << self    
      def google_data_type(value)
        if value.is_a?(Numeric)
          data_type = 'number'
        elsif value.is_a?(Date)
          data_type = 'date'
        elsif value.is_a?(DateTime) || value.is_a?(Time)
          data_type = 'datetime'
        elsif value.respond_to?(:to_s)
          if !value.match(/[^0-9.]/)
            data_type = 'number'
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

      def ruby_to_js(type, value, prune = false)
        return nil if value.nil? && prune
        if type == 'string'
          value = "'#{value}'"
        elsif type == 'date'
          temp_d = Date.parse(value.to_s)
          value = "new Date(#{temp_d.year}, #{temp_d.month - 1}, #{temp_d.day})"
        elsif type == 'datetime'
          temp_d = DateTime.parse(value.to_s)
          value = "new Date(#{temp_d.year}, #{temp_d.month - 1}, #{temp_d.day}, #{temp_d.hour}, #{temp_d.min}, #{temp_d.sec})"
        end
        return value
      end
    end
  
  end
end