module SortNull
  extend ActiveSupport::Concern
  
  def sort_null(contents, max_sort=9999)
    contents_ = contents.map do |c|
      c.sort = max_sort if c.try(:sort).nil? or c.try(:sort) == ''
      c
    end
    contents_.sort_by(&:sort)
  end
end
