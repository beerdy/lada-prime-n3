class Tradein::ParsersController < ApplicationController
  def index
  end

  def create
    loaded_links = []

    if params[:link_import_avito] and params[:link_import_avito] != ''
      links = params[:link_import_avito].split "\n"

      links.each do |current_link|
        parser = LadaPrime::Parser.new
        parser.load current_link
        parser.parse

        image_links = parser.data.delete 'image_links'

        if image_links.count > 0
          params.merge!( :tradein_cars => parser.data )
          pp tradein_car_params
          tradein_car = Tradein::Car.create( tradein_car_params )

          image_links.each do |link|
            tradein_save_image( tradein_car.id, link )
          end
          
          loaded_links.push current_link
        end
      end

      if loaded_links.count > 0
        render json: { status: 'ok', loaded: loaded_links }, status: :accepted
      else
        render json: { status: 'errorupload' }, status: :accepted
      end
    else
      render json: { status: 'errorservice' }, status: :accepted
    end
  end

  private
    # Avito
    # For Avito image
    def tradein_save_image tradein_car_id, link
      tradein_car_image = Tradein::CarImage.new( tradein_car_id: tradein_car_id )
      return unless tradein_car_image.picture_from_link( link )
      tradein_car_image.save
    end
    def tradein_car_params
      params.require(:tradein_cars).permit(:title,:description,:comments,:url,:sort,:model,:lineup,:case,:year,:mileage,:color,:engine,:capacity,:transmission,:wheel,:drive,:condition,:owners,:power,:price,:title, :description, :slave, :string, :url, :sort)
    end
end
