module ModificationHelper
  def modification_link model_octet, modification_octet
    if modification_octet and model_octet
      "/models/"+model_octet+"/modifications/"+modification_octet
    else
      "#"
    end
  end
  def sort_modifications modifications, modifications_sorted = []
    modifications.each_with_index do |modification, index|
      if modification.complectations_minimum_price >= @pricemin and modification.complectations_minimum_price <= @pricemax
        modification.price_sort = modification.complectations_minimum_price
        modifications_sorted.push modification
      end
    end

    case @pricesort
    when 'min'
      puts "SORT_BY MIN"+"="*50
      modifications_sorted.sort_by(&:price_sort) 
    when 'max'
      puts "SORT_BY MAAX"+"="*50
      modifications_sorted.sort_by(&:price_sort)
    else
      puts "SORT_BY NO- #{@pricesort}"+"="*50
      modifications_sorted
    end
  end
end
