require 'json'
require 'singleton'

class Response 
   
  include Singleton

  def initialize
    @response = Hash.new(0)  
  end

  def init(name)
    @name = name
  end

  def name
    @name
  end

  def add(elementId, responseHTML) 
    @response[elementId] = responseHTML
  end
  
  def remove(elementId)
    @response.delete(elementId)
  end
 
  def update(elementId, responsHTML)
   @response[elementId] = responseHTML
  end

  def getJSONResponse()
    JSON.parse(@response) 
  end
  
  def view()
    if @name == 'login'
      @response['login']
    elsif @name == 'home-page'
      @response['home-page']
    else
      @response
    end
  end
end
