module ParserOfficialSite
  class ModificationColor
    attr_reader :colors, :modification_base_id

    def initialize domain
      @domain = domain
      @colors = []

      parse_content get_content
    end

    def parse_content data
      # get colors
      colors = get_colors( data )
      colors.each do |item|
        @colors.push({
          code:  item.attributes["color_code"].value,
          title: item.attributes["title"].value,
          rgb:   item.attributes["color_rgb"].value
        })
      end if colors
      # get modifications
      @modification_base_id = get_modification( data )
    end

    private
      def get_content
        content = open( @domain ) do |http|
          @html = http.read
        end

        # Parse content
        Nokogiri::HTML( content )
      end
      def get_colors data, colors=nil
        begin
          return data.css('#colors').css('.color')
        rescue Exception => e
          return colors
        end
        return 
      end
      def get_modification data, modification='0'
        begin
          return data.css('.kompl_compare')[0].attributes['base_id'].value
        rescue Exception => e
          return modification
        end
      end
  end
end