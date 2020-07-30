module ComplectationHelper
  
  def complectations_ complectations, list=[]
    complectations.each do |complectation|  
      list.push complectation.name unless list.include? complectation.name
    end
    list
  end

  def sort_complectations complectations, sorted = []
    case @pricesort
    when 'min'
      complectations = complectations.sort_by(&:price_new)  
    when 'max'
      complectations = complectations.sort_by(&:price_new).reverse
    end

    complectations.each do |complectation|
      if complectation.price_new.to_i >= @pricemin and complectation.price_new.to_i <= @pricemax
        sorted.push complectation
      end
    end
    sorted
  end

end
