module FilterCars

  # === Init params get request ===
  def filter_price
    pricemin  = 0
    pricemax  = 15000000
    pricesort = nil
    pricemin  = params[:pricemin]  if params[:pricemin]  != '' if params[:pricemin]
    pricemax  = params[:pricemax]  if params[:pricemax]  != '' if params[:pricemax]
    pricesort = params[:pricesort] if params[:pricesort] != '' if params[:pricesort]
    bymodel   = params[:bymodel]   if params[:bymodel]   != '' if params[:bymodel]
    bylineup  = params[:bylineup]  if params[:bylineup]  != '' if params[:bylineup]

    @pricemin = pricemin.to_i
    @pricemax = pricemax.to_i
    @pricesort = pricesort
    @bymodel = bymodel
    @bylineup = bylineup
  end

  # === Sort by price ===
  class Element
    attr_accessor :price_sort, :modification 
    def initialize( price_sort, modification )
      @price_sort = price_sort.to_i
      @modification = modification
    end
  end

  class Filter
    attr_accessor :elements
    def initialize(pricemin,pricemax)
      @pricemin, @pricemax = pricemin, pricemax
      @modifications = []
      @elements = []
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
    def by_model model
      by_param 'model', model
    end
    def by_lineup lineup
      by_param 'lineup', lineup
    end

    private
      def by_param method_name, string
        return if string.nil? 
        # If this filter first then init 'elements'
        @elements = @modifications if @elements.count <= 0

        elements = []
        @elements.each_with_index do |element, i|
          elements.push element unless element.modification.public_send(method_name).scan(string).count <= 0 
        end
        @elements = elements
      end
  end
end