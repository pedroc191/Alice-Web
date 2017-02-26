
class HomeController < ApplicationController
  
  include HTTParty

  def index
    @response = HTTParty.get(Url_WebServices() + '/roles.json')
  end

  def empresa
  end

  def servicios
  end
  
  def eventos
  end

  def noticias
  end

  def contacto
  end
end
