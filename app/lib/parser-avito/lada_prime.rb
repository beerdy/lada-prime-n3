module LadaPrime
  class Parser
    attr_reader :data

    def initialize
      @data = {}
    end
    
    def load url
      if Rails.env.production?
        html = `ssh rails5@81.20.204.174 -p 22227 /home/rails5/Dev/github/lada-prime/parser/engine.sh #{url}`
      else
        @doc = Nokogiri::HTML(html)
      end
    end

    def parse
      # Filter
      @doc.css('.item-params-list-item').each do |item|
        text = item.text
        case text
        when /Марка(.+)/ 
          get_item 'model', $1
        when /Модель(.+)/
          get_item 'lineup', $1
        when /Тип кузова(.+)/
          get_item 'case', $1
        when /Год выпуска(.+)/
          get_item 'year', $1
        when /Пробег(.+)/
          # with fake -> ': '
          get_item 'mileage', ": #{$1.scan(/\d+/).first}"
        when /Цвет(.+)/
          get_item 'color', $1
        when /Тип двигателя(.+)/
          get_item 'engine', $1
        when /Модификация(.+)/
          item = $1
          item.match(/(\d+\.\d+)/)
          capacity = $1
          item.gsub(capacity,'').match(/(\d+)/)
          power = $1

          get_item 'capacity', ": #{capacity}"
          get_item 'power', ": #{power}"
        when /Коробка передач(.+)/
          get_item 'transmission', $1
        when /Руль(.+)/
          get_item 'wheel', $1
        when /Привод(.+)/
          get_item 'drive', $1
        when /Состояние(.+)/
          get_item 'condition', $1
        when /Владельцев по ПТС(.+)/
          get_item 'owners', $1
        end
      end

      # Price
      @doc.css('.js-item-price').each do |price|
        @data.merge!({ :price => price.text.gsub(/\s+/, '') })
        break
      end

      # Description 
      @doc.css('.item-description-text').each do |comments|
        @data.merge!({ :comments => comments.inner_html.strip})
        break
      end

      # Complectation
      @doc.css('.advanced-params').each do |description|
        @data.merge!({ :description => "<ul class='advanced-params'>#{description.inner_html.strip}</ul>" })
        #File.write('avito.description', description.inner_html.strip)
        break
      end

      # Images
      image_links = []
      @doc.css('.gallery-img-wrapper').each do |image_tag|

        src = image_tag.at_css('.gallery-img-frame')
        unless src.nil?
          image_link = "#{src.attr('data-url')}"
          image_links.push image_link
          # image_options = URI.parse image_link
          # image_name = File.basename(image_options.path)
          # image = MiniMagick::Image.open(image_link)
          # p image.type        #=> "JPEG"  
          # p image.mime_type   #=> "image/jpeg"
          # p image.width       #=> 250
          # p image.height      #=> 300
          # p image.dimensions  #=> [250, 300]
          # p image.size        #=> 3451 (in bytes)
          # p image.colorspace  #=> "DirectClass sRGB"
          # p image.exif        #=> {"DateTimeOriginal" => "2013:09:04 08:03:39", ...}
          # p image.resolution  #=> [75, 75]
          # p image.signature   #=> "60a7848c4ca6e36b8e2c5dea632ecdc29e9637791d2c59ebf7a54c0c6a74ef7e"
          # file.write  "public/assets/tmp/#{image_name}"
        end
      end
      @data.merge!({ 'image_links' => image_links }) if image_links.count > 0
    end

    private
      def get_item key, value
        #puts  value
        arr = value.split ':'
        # remove space in start string
        model = arr[1].gsub(/^\s+/, '')
        @data.merge!({ key.to_sym => model })
      end
  end
end