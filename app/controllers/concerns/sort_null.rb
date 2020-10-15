module SortNull
  extend ActiveSupport::Concern
  
  def sort_null(contents, max_sort=9999)
    contents_ = []
    contents.each do |c|
      
      c.sort = max_sort
      contents_.push c
    end
    pp contents_
    contents_

  end
end
