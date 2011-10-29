require 'singleton'

class User 
  include Singleton

  def initialize()
  
  end

  def getHomePage()
    RESPONSE.add('home-page', "Home page")
  end

end

USER = User.instance
