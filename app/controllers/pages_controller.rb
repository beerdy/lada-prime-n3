class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    if @page.meta != '' and @page.meta != nil
      @description_and_title = @page.meta
    else
      doc = Nokogiri::HTML::fragment @description_and_title
      title = doc.at_css('title').text
      doc.at_css('title').content = @page.title + " | " + title
      @description_and_title = doc.to_html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by( link: params[:id] )
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
