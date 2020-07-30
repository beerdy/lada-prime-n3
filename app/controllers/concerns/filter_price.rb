module FilterPrice

  # === Init params get request ===
  def filter_price
    pricemin = 0
    pricemax = 15000000
    pricesort = nil
    pricemin = params[:pricemin] if params[:pricemin]
    pricemax = params[:pricemax] if params[:pricemax]
    pricesort = params[:pricesort] if params[:pricesort]

    @pricemin = pricemin.to_i
    @pricemax = pricemax.to_i
    @pricesort = pricesort
  end

  # === Sort by price ===
  class Element
    attr_accessor :price_sort, :modification 
    def initialize( price_sort, modification )
      @price_sort = price_sort
      @modification = modification
    end
  end
  class Filter
    attr_reader :elements
    def initialize(pricemin,pricemax)
      @pricemin, @pricemax = pricemin, pricemax
      @modifications = []
    end
    def add price_sort, modification
      if price_sort >= @pricemin and price_sort <= @pricemax
        @modifications.push Element.new( price_sort, modification ) 
      end
    end
    def sort_price pricesort
      case pricesort
      when 'min'
        @elements = @modifications.sort_by(&:price_sort)  
      when 'max'
        @elements = @modifications.sort_by(&:price_sort).reverse
      else
        @elements = @modifications
      end
      
    end
  end
end