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

      @name         = @doc.css('#zag').text.gsub!('КОНФИГУРАТОР', '')
      
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
        prices = get_prices item

        @table.push({
          :kompl_id   => item.attributes["id"],
          :kompl_name => item.css('.kompl_name').text,
          :colors_htm => get_colors( item.css('.has_dealer') ),
          :price_new  => prices[0].text,
          :price_old  => prices[1].try(:text)
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
  
  end
end