module ParserOfficialSite

  class Complectation
    attr_reader :table, :colors_block, :colors_options, :name, :price_min_str, :devise, :id, :pdf_price
    attr_accessor :colors_btns, :url1

    def initialize
      @table          = []
      @price_min      = 9999999
      @price_min_str  = '100 000 руб'
      @devise         = "ЛАДА Липецк ПРАЙМ!"
      @colors_options = {}
      @colors_btns    = ''
    end
    
    def load url
      html = open(url)
      @doc = Nokogiri::HTML(html)
    end
    
    def parse
      @id           = @doc.css('.kompl_compare')[0]['base_id'].to_i
      @name         = @doc.css('#zag').text.gsub!('КОНФИГУРАТОР', '').scan(/([a-zA-Zа-яА-Я0-9.]+)/).join(' ')
      @devise       = @doc.css('#zagtxt').inner_html
      @colors_block = @doc.css('.color_list')[0].inner_html
      @pdf_price    = @doc.css('.all_compl')[0]["href"]

      @doc.css('.kompl').each do |item|
        item_params item
      end

      # Style & code color buttons as Hash
      @doc.css('.color').each do |item|
        @colors_options[ item['color_code'].to_i ] = { 
          :style => item['style'],
          :title => item['title']
        }
      end

      # Modify in controller from BD
      # @colors_btns = @doc.css('#colors').inner_html
    end

    private
      def modify_color_btns
        @doc.css('.cars-menu__base-name').each do |link|
          hreff_arr = link["href"].split '/'
          link.attributes["href"].value = "/complectations/#{hreff_arr[3]}-#{hreff_arr[4]}?original=#{link["href"]}"
          link["target"] = "_blank"
        end
        
      end

      def item_params item
        prices   = get_prices item
        kompl_id = item.attributes["id"]
        @table.push({
          :kompl_id   => kompl_id.value,
          :kompl_name => item.css('.kompl_name').text,
          :colors_htm => get_colors( item.css('.has_dealer') ),
          :price_new  => prices[0].text,
          :price_old  => prices[1].try(:text),
          :property   => get_property( kompl_id )
        })
      end

      def get_prices item
        prices = []
        item.css('.kompl_price').each do |price|
          prices.push price
        end
        
        price_new = prices[0].text.to_i

        if @price_min > price_new
          @price_min     = price_new 
          @price_min_str = prices[0].text[0...-5]
        end

        return prices 
      end

      def get_colors item
        colors = ''
        item.css('.color_dealer').each do |color|
          colors += color.to_s
        end

        return colors
      end

      def get_property kompl_id
        property = []
        @doc.css("##{kompl_id}_kompl_box").css(".kompl_config_uzel").each do |item|
          property.push({ 
            id:      item.attributes["uzel_id"].value,
            name:    item.text,
            options: get_options( kompl_id, item.attributes["uzel_id"] )
          })
        end
        property
      end

      def get_options kompl_id, uzel_id
        options = []
        @doc.css("##{kompl_id}_#{uzel_id}").each do |item|
          item.children.children.each do |i|
            option = i.text[2..i.text.length]
            options.push option if option
          end
        end
        options
      end
  
  end
end