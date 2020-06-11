class MainController < ApplicationController
  def index
    @message  = Message.new
    @models   = Model.all
    @products = Product.all
    expires_in 3.hours, public: true
  end
end
