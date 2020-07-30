module ComplectationProperties
  extend ActiveSupport::Concern
  
  # Level 3
  class Item
    attr_accessor :title
    def initialize item
      @title = item
    end
  end

  # Level 2
  class Propirties
    attr_accessor :name
    attr_accessor :items
    def initialize name, items
      @items = []
      @name  = name
      items.each do |item|
        @items.push Item.new(item)
      end
    end
  end
  
  # Level 1
  class OptionsProperties
    def initialize options
      @properties = []
      @options = options
    end

    def make
      options = {}
      @options.each do |option|
        if options.has_key?(option.property)
          options[option.property].push( option.name )
        else
          options[option.property] = [option.name]
        end
      end
      options.each do |property, items|
        @properties.push Propirties.new(property, items)
      end
      @properties
    end
  end
end