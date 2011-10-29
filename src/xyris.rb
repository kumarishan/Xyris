$LOAD_PATH << './lib'
$LOAD_PATH << './controller'

require 'sinatra'
require 'logger'

#### LIBS ####
require 'request.rb'
require 'response.rb'

#### CONTROLLER ####
require 'user_controller.rb'
require 'login_controller.rb'

use Rack::Session::Pool, :expire_after => 2592000
set :session_secret, 'super secret'


RESPONSE = Response.instance
REQUEST = Request.instance

LOG = Logger.new('Xyris.log', 0, 100*1024*1024)

before do
  $session = session
  unless $session['userId'] or request.path_info == '/login'
    redirect to('/login')
  end
end

get '/' do
  RESPONSE.init("home-page")
  REQUEST.init("home-page")
  LOG.debug("The request is set to #{REQUEST.name} and response is set to #{RESPONSE.name}") 
  USER.getHomePage()    
  RESPONSE.view()
end

get '/login', :provides => 'html' do
  'Dude! you have to login first'
  RESPONSE.init('login')
  REQUEST.init('login') 
  LOGIN.getLoginForm()
  RESPONSE.view() 
end

post '/login' do 
  RESPONSE.init('logged-in')
  REQUEST.init('log-in')
  LOGIN.login()
  redirect to('/')   
end

get '/feeds' do 
  'The current feeds for the user'
end

get '/user/:id' do
  "show the user #{params[:id]}'s profile"
end

get '/friends' do 
  "get user's friends"
end

get '/subscriptions' do 
  "get user's subscriptions"
end

get '/feed/:id/feed' do 

end

get '/feed/:id/categories' do

end

get '/feed/:id/bookmarks' do 

end

get '/user/:id/friends' do
  "get user #{params[:id]}'s friends"
end

get '/user/:id/feeds' do 
  "get user #{params[:id]}'s feeds"
end


