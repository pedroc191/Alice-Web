
class HomeController < ApplicationController
  
  include HTTParty

  def index
    #@response = HTTParty.get(Url_WebServices() + '/roles.json')
    @url = Url_WebServices()
    @noticias = HTTParty.get(Url_WebServices() + '/noticias.json')
    @eventos = HTTParty.get(Url_WebServices() + '/eventos.json')
    #@tipo_servicio =  HTTParty.get(Url_WebServices() + '/tipo_servicios/1.json')

    #@foto = Url_WebServices() + @tipo_servicio['foto']
  end

  def create
    #@descripcion = params[:descripcion]
    #@token = params[:authenticity_token]

    #roles = { body: { tipo_adiccion: { descripcion: @descripcion, authenticity_token: @token } } }
    
    #prueba = HTTParty.post(Url_WebServices() + '/tipo_adicciones.json', roles)

    #Respond_notice(prueba)

    #redirect_to root_path  
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

  def solicitar
  end

  def solicitar2
  end

  def solicitar3
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def roles_params
      params.require(:roles).permit(:descripcion)
    end
end
