module ParserLogger
  extend ActiveSupport::Concern
  class ParserLogger
    attr_accessor 
  end
  def parser_logger
    ParserLogger.new
  end
end
