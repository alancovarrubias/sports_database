class RowMap
  attr_reader :key, :value
  def initialize(row, keys, options)
    @row = row
    @keys = keys
    @options = options
  end

  def attributes
    return Hash[@keys.map do |key|
      [key, get_value(key)]
    end]
  end

  private
    def get_value(key)
      if key_options = @options[key]
        model = key_options[:model]
        map = key_options[:map]
        return model.send(map, @row[key.to_s])
      else
        return @row[key.to_s]
      end
    end
end
