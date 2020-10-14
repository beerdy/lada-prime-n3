class Tradein::MainController < ApplicationController
  include FilterCars
  
  # From params in included FilterCars
  before_action :filter_price, only: [:index]
  
  before_action :set_filter, only: [:index]  
  
  before_action :set_tradein_cars, only: [:index]

  def index
  end

  private
    def set_tradein_cars
      @models = []
      @lineups = []

      # Get models for select
      cars = Tradein::Car.all
      cars.each do |car|
        @models.push << car.model unless @models.include? car.model
        # Set min_max
        # unless @bymodel
          @pricemin = car.price if @pricemin < car.price.to_i
          @pricemax = car.price if @pricemax > car.price.to_i
        # end
        puts "#{@pricemin} #{@pricemax} current #{car.price.to_i}"
      end
      
      # Filter initialize
      cars.each do |car|
        @filter.add car.price, car
      end

      # Filter price
      @filter.sort_price @pricesort

      # Filter model
      @filter.by_model @bymodel

      # Filter lineup
      @filter.by_lineup @bylineup
      
      # Filtred cars
      @tradein_cars = @filter.elements

      # Get lineup for select
      cars.each do |car|
        # For all models
        if car.model.scan(@bymodel).count > 0 
          @lineups.push << car.lineup unless @lineups.include? car.lineup
          # Set min_max
          @pricemin = car.price if @pricemin < car.price
          @pricemax = car.price if @pricemax > car.price
        else
          
        end
        puts "'#{car.model}' == '#{@bymodel}'"
      end if @bymodel # If model selected

    end

    private
      def set_filter
        @filter = Filter.new( @pricemin, @pricemax )
      end
end
