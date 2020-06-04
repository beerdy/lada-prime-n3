# Dynamic refresh code 
# in development mode

module CodeWatcher
  def load_source
    Dir[Rails.root.join('app/lib/**/*.rb')].each{ |rb|
      load rb
    }
  end
end