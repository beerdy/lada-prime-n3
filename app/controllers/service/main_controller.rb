class Service::MainController < Service::ServiceController
  include SortNull
  def index
    @service_sliders = sort_null(Service::Slider.all).sort_by(&:sort).reverse
    pp @service_sliders
  end
end
