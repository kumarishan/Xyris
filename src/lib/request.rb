require 'singleton'

class Request
  
  include Singleton

  def initialize
    @request = Hash.new(0)
  end

  def init(name)
    @name = name
  end
  
  def name
    @name
  end

  def get(key)
    @request[key]
  end

  def set(key, value)
   @request[key] = value
  end

end

