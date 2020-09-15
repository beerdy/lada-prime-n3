class MainController < ApplicationController
  def index
    @message  = Message.new
    @models   = Model.all
    @products = Product.all
    expires_in 3.hours, public: true
  end
  # Заглушка для несуществующих route. К примеру картинок подгружаемых библиотеками JS
  def missing
    render json: { status: 'nmissing' }, status: :accepted
  end
end
