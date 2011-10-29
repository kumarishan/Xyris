require 'haml'

class ViewHelper 
  
  def render(name)
    template = File.read("views/#{name}.haml")
    @engine = Haml::Engine.new(template)	
    @engine.render
  end

end
