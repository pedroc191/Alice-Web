
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
    @tipo_opinion = self.class.get('/tipo_opiniones.json')    
  end
  def contactar
  
    @nombre = params[:nombre]
    @email = params[:email]
    @tipo_opinion = params[:tipo_opinion]
    @mensaje = params[:mensaje]

    contacto = {
      body:
        {
          opinion:{
            nombre: @nombre,
            correo: @email,
            tipo_opinion_id: @tipo_opinion,
            descripcion: @mensaje
          }
        }
    }

    respuesta = self.class.post('/opiniones.json', contacto)

    Respond_notice(respuesta)

    redirect_to '/home/contacto'
  
  end

  def suscripcion
    @especialidades = self.class.get('/especialidades.json')
    @tipo_noticias = self.class.get('/tipo_noticias.json')
    @tipo_eventos = self.class.get('/tipo_eventos.json')
  end

  def suscribirse

    @nombre = params[:nombre]
    @apellido = params[:apellido]
    @correo = params[:correo]
    @especialidades = params[:especialidades]
    @tipo_noticias = params[:tipo_noticias]
    @tipo_eventos = params[:tipo_eventos]

    json = {
            body: {
                  suscriptor: {
                          nombre: @nombre,
                          apellidos: @apellido,
                          correo: @correo,
                          especialidades: @especialidades,
                          tipo_noticias:  @tipo_noticias,
                          tipo_eventos: @tipo_eventos
                        }
                  }
          }
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts json
    #@servicio = HTTParty.post(Url_WebServices() + '/suscriptores.json', json)

    #Respond_notice( @servicio )

    #redirect_to root_path#

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
