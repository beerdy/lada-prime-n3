    def anchor_name url
      begin
        return url.split('/')[4]
      rescue Exception => e
	puts 'no'
      end
      return 'anchor'
    end 
puts anchor_name('')
