class ModificationImagesController < ApplicationController
  def image
    modification_image = ModificationImage.find_by(color_id: modification_image_params[:color_id], modification_id: modification_image_params[:modification_id])
    
    if modification_image
      if modification_image_params[:original]
        render json: { html: '<img class="ml" src="'+modification_image.image.url+'">' }, status: 200
      else
        render json: { html: '<img class="ml" src="'+modification_image.image.url(:medium)+'">' }, status: 200
      end
    else
      render json: { errors: 'not found image' }, status: 404
    end
  end

  private
    def modification_image_params
      params.require(:modification_image).permit( :color_id, :modification_id, :original )
    end
end
