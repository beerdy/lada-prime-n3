class MainController < ApplicationController
  include SortNull
  def index
    @message  = Message.new
    @models   = Model.all
    @products = sort_null(Product.all).sort_by(&:sort).reverse
    @sliders  = sort_null(Slider.all).sort_by(&:sort).reverse
    expires_in 3.hours, public: true
  end
  # Заглушка для несуществующих route. К примеру картинок подгружаемых библиотеками JS
  def missing
    render json: { status: 'nmissing' }, status: :accepted
  end
end