    def get_anchor_name url
      anchor_name = 'some'
      begin
        return  url.split('/')[4]
      rescue Exception => e
        anchor_name = 'no more' 
      end
      return anchor_name
    end
puts  "#{get_anchor_name('some')}"
