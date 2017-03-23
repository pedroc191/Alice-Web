
class HomeController < ApplicationController
  
  def index
    
    @noticias = self.class.get('/noticias.json')
    
    @eventos = self.class.get('/eventos.json')
    
  end

  def contacto
    @info_contacto = self.class.get('/informacion_generals.json')
    @tipo_opinion = self.class.get('/tipo_opiniones.json')  
    puts @info_contacto  
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
=begin
    contacto = {
      body:
        {
          usuario:{
            email: 'pietro.c191@gmail.com',
            password: 'pgca194546',
            password_confirmation: 'pgca194546',
            rol_id: 1
          },
          persona:{
            cedula: '20469018',
            nombre: 'Pedro G.',
            apellido: 'Camacaro A.',
            telefono: '424-550-7422',
            fecha_nacimiento: '11/06/1991',
            direccion:'Cabudare',
            sexo_id: 1
          }
        }
    }

    respuesta = self.class.post('/usuarios.json', contacto)

    Respond_notice(respuesta)

    redirect_to '/home/contacto'
=end
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
                  usuario: {
                          nombre: @nombre,
                          apellidos: @apellido,
                          correo: @correo,
                          rol_id: 4
                          #especialidades: @especialidades,
                          #tipo_noticias:  @tipo_noticias,
                          #tipo_eventos: @tipo_eventos
                        }
                  }
          }
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts json
    @servicio = self.class.post('/.json', json)

    Respond_notice( @servicio )

    redirect_to root_path#

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
