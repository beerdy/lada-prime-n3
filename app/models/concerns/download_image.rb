module DownloadImage
  extend ActiveSupport::Concern

  class Downloader
    attr_reader :image

    def initialize
      @seconds    = 5
      @downloaded = false
      @image      = nil  
    end

    def start link
        @link = link
        # Не больше семи секунд на загрузку одного изображения
        time_ = @seconds*7
        current_listen = listen_thread

        # Завершаем задержку завершения "циклера" если сообщение поступило раньше time
        (time_).times do
          @downloaded ? break : sleep(0.1)
        end
        
        current_listen.terminate
    end

    def image_downloaded?
      @downloaded
    end

    private
      def listen_thread
        Thread.abort_on_exception = true
        Thread.new do
          loop do
            Rails.logger.debug  "Link for save from avito - #{@link}"
            begin
              @image = open(@link)
              @downloaded = true
            rescue Exception => e
              Rails.logger.debug  "Error upload file from avito - #{e}"
              break
            end
          end
        end
      end
  end
end