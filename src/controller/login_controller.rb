require 'singleton'
require 'haml'
require 'sinatra'
require 'rubygems'

require 'viewHelper.rb'

class Login 

  include Singleton

  def initialize()
    @view = ViewHelper.new() 
  end
  
  def getLoginForm()
    RESPONSE.add('login', @view.render('login'))
  end

  def login()
    $session['userId'] = 'ishan' 
  end

end 

LOGIN = Login.instance
