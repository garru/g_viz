module GViz
  class Data
    
    def initialize(data, map)
      @map = map
      @data = data
      @data_type = {}
      import_data_types
    end

    def import_data_types
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

    def rows(prune = false)
      @data.map do |value|
        @map.map do |k, v|
          self.class.ruby_to_js(@data_type[k], value[k], prune)
        end
      end
    end

    def rows_hash(prune = false)
      @data.map do |value|
        @map.inject({}) do |maps, (k, v)|
          maps[v] = self.class.ruby_to_js(@data_type[k], value[k], prune)
          maps
        end
      end
    end

    def to_json
      @json ||= begin
        {
          :columns => columns.inject({}){|hash, (k,v)| hash[v] = k; hash},
          :data => rows_hash
        }.to_json
      end
    end
    
    def data_name
      "data_#{@data.object_id}"
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
          value = "#{value}"
        elsif type == 'date'
          value = Date.parse(value.to_s)
        elsif type == 'datetime'
          value = DateTime.parse(value.to_s)
        end
        return value
      end
    end
  end
end