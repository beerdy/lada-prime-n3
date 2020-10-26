class ApplicationController < ActionController::Base
  include CodeWatcher
  
  protect_from_forgery with: :exception
  before_action :code_watcher
  before_action :set_current_section

  def initialize
    super
    @message = Message.new

    Content.all.each do |content|
      @head      = content if content.url == 'head'
      @contacts  = content.description if content.url == 'contacts'
      @projects  = content.description if content.url == 'projects'
      @makeorder = content.description if content.url == 'makeorder'
      @services  = content.description if content.url == 'services'
      @phone     = content.description if content.url == 'phone'
      @email     = content.description if content.url == 'email'
      @place     = content.description if content.url == 'place'
      @map       = content.description if content.url == 'map'
      @footer    = content.description if content.url == 'footer'
    end
    
    @keywords_and_other    = @head.slave
    @description_and_title = @head.description

    @sliders = sort_null(Slider.all).sort_by(&:sort).reverse
  end

  private
    def set_current_section
      uris = ['','']
      uris = request.env['PATH_INFO'].split '/'

      if uris[1] == 'service'
        @current_section = 'srv-cars'
      elsif uris[1] == 'tradein'
        @current_section = 'old-cars'
      else
        @current_section = 'new-cars'
      end
    end
    # Dynamic refresh code 
    # in development mode
    def code_watcher
      if Rails.env.development?
        logger.info "Application loaded in development mode. And lib's file reload after next request"
        load_source
      else
        logger.info "Application loaded in production mode. And lib's file loaded once"
      end
    end
end
