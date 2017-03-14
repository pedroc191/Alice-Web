
class HomeController < ApplicationController
  
  def index
    
    @noticias = self.class.get('/noticias.json')
    
    @eventos = self.class.get('/eventos.json')
    
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
    @info_contacto = self.class.get('/informacion_generals.json')    
  end
  def contactar
  
    @contacto.nombre = params[:nombre]
    @contacto.email = params[:email]
    @contacto.tipo_opinion = params[:tipo_opinion]
    @contacto.mensaje = params[:mensaje]

    contacto = {
      body:
        {
          contacto:{
            nombre: @contacto.nombre,
            email: @contacto.email,
            tipo_opinion: @contacto.tipo_opinion,
            descripcion: @contacto.mensaje
          }
        }
    }

    respuesta = selef.class.post('/opinion.json', contacto)

    Respond_notice(Get_respuesta)

    redirect_to contactos_path
  
  end
  def suscribirse
  end

  def solicitar
  end

  def solicitar2
  end

  def solicitar3
  end

  def preguntas_frecuentes

    @categorias = self.class.get('/tipo_preguntas.json')
    
    if params[:id].nil?
    
      @preguntas = self.class.get('/preguntas.json')
    
    else
      
      @preguntas = self.class.get(self.class.base_uri + '/preguntas.json?id=' + params[:id])
    end
  end

  private

end
