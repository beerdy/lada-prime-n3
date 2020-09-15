class Service::ServiceController < ApplicationController
  layout "service"
  before_action :set_write

  private
    def set_write
      @service_write = Service::Write.new
    end
end
