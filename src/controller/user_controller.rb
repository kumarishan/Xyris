require 'singleton'

class User 
  include Singleton

  def initialize()
  
  end

  def getHomePage()
    RESPONSE.add('home-page', "Hello Universe! Welcome to the world of social feed reader" )
  end

end

USER = User.instance
