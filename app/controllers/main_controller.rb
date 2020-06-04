class MainController < ApplicationController
  def index
    @message  = Message.new
    @models   = Model.all
    @products = Product.all
  end
end
