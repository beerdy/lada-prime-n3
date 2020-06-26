module ParserOfficialSite
  
  class Model
    attr_reader :models

    def initialize url
      @models = []

      parse_content get_content url
    end
    
    def parse_content data
      # Get model`s
      fiber_model = Fiber.new do
        data.css('.cars-menu__sem-name').each do |model|
          Fiber.yield model.text, model.parent.attributes["href"].value
        end
      end

      # Get image`s
      fiber_image = Fiber.new do
        data.css('.cars-menu__sem-img').each do |image|
          Fiber.yield image.attributes["src"].value
        end
      end

      # Get complectation`s for model`s
      data.css('.cars-menu__sem').each do |block|
        model = nil
        image = nil

        # Remove &nbsp and other null first and last symbols
        model_, link = fiber_model.resume
        image = fiber_image.resume
        model = model_.scan(/(\w+\s*\w+)/)[0][0]


        # Next element if image OR model not exist 
        next if image.nil? or model.nil?

        # [ {name: '', url:''}, .. ]
        complectations = []
        block.css('.cars-menu__base-name').each do |complectation|
          complectations.push({"name" => complectation.text, "url" => complectation.attributes["href"].value })
        end

        @models.push({ "model" => model, "link" => link ,"image" => image, "complectations" => complectations })
      end

      @models
    end

    private

      # If not exist then parse ELSE get content from BD
      def get_content url
        time    = Time.now.strftime "%d/%m/%Y"
        
        content = nil

        if content
          # puts "CONTENT FROM BD"

        else
          # puts "!!!CONTENT FROM SITE!!!"

          # Open url parsed site and read HTML
          content = open( url ) do |http|
            @html = http.read
          end

        end
        
        # Parse content
        Nokogiri::HTML( content )
      end

  end
end