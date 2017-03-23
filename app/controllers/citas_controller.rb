class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]

  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @cita = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  def consultar
    @cita = self.class.get('/citas/'+params[:cita_id]+'.json')
    @paciente = self.class.get('/personas/'+@cita["persona_id"].to_s+'.json')
    @tipo_cita = self.class.get('/tipo_citas/'+@cita['tipo_cita_id'].to_s+'.json')
    
    puts '@@@@@@@@@@@@@@@@@@@@@@@'
  end

  def registrar
    #raise params
    ############### CITA

    @semana = params[:week].to_date.at_beginning_of_week
    @servicio  = params[:slug]
    @tipo_usuario = params[:tipo_usuario]
    @tipo_cita = params[:tipo_cita]

    ############## NuEVO USUARIO (SOLICITANTE)

    @email_usuario = params[:email_usuario]
    @password_usuario = params[:password_usuario]
    @email_solicitante = params[:email_solicitante]
    @password_solicitante = params[:email_solicitante]
    @cedula_solicitante = params[:cedula_solicitante]
    @nombre_solicitante = params[:nombre_solicitante]
    @apellido_solicitante = params[:apellido_solicitante]
    @sexo_solicitante = params[:sexo_solicitante]
    @fecha_nacimiento_solicitante = params[:fecha_nacimiento_solicitante]
    @telefono_solicitante = params[:telefono_solicitante]
    @direccion_solicitante = params[:direccion_solicitante]
    @tipo_paciente = params[:tipo_paciente]
    @sexo_paciente_usuario = params[:sexo_paciente_usuario]

    ############## PACIENTE NUEVO    

    @sexo_paciente_nuevo = params[:sexo_paciente_nuevo]
    @cedula_paciente_nuevo = params[:cedula_paciente_nuevo]
    @nombre_paciente_nuevo = params[:nombre_paciente_nuevo]
    @apellido_paciente_nuevo = params[:apellido_paciente_nuevo]
    @fecha_nacimiento_nuevo = params[:fecha_nacimiento_nuevo]





    if (!params[:turno1].nil? and params[:turno1]!="")
        @turno = 13
        @hora = params[:turno1]
        @fecha = @semana.to_date
    end
    if (!params[:turno2].nil?  and params[:turno2]!="")
        @turno = 11
        @hora = params[:turno2]
        @fecha = @semana.to_date + 1.day
    end
    if (!params[:turno3].nil? and params[:turno3]!="")
        @turno = 9
        @hora = params[:turno3]
        @fecha = @semana.to_date + 2.day
    end
    if ((!params[:turno4].nil?)  and (params[:turno4]!=""))
        @turno = 7
        @hora = params[:turno4]
        @fecha = @semana.to_date + 3.day
    end
    if (!params[:turno5].nil? and params[:turno5]!="")
        @turno = 5
        @hora = params[:turno5]
        @fecha = @semana.to_date + 4.day
    end
    if (!params[:turno6].nil? and params[:turno6]!="")
        @turno = 3
        @hora = params[:turno6]
        @fecha = @semana.to_date + 5.day
    end
    if (!params[:turno7].nil? and params[:turno7]!="")
        @turno = 1
        @hora = params[:turno7]
        @fecha = @semana.to_date + 6.day
    end
    if (!params[:turno8].nil? and params[:turno8]!="")
        @turno = 12
        @hora = params[:turno8]
        @fecha = @semana.to_date
    end
    if (!params[:turno9].nil? and params[:turno9]!="")
        @turno = 10
        @hora = params[:turno9]
        @fecha = @semana.to_date + 1.day
    end
    if (!params[:turno10].nil? and params[:turno10]!="")
        @turno = 8
        @hora = params[:turno10]
        @fecha = @semana.to_date + 2.day
    end
    if (!params[:turno11].nil? and params[:turno11]!="")
        @turno = 6
        @hora = params[:turno11]
        @fecha = @semana.to_date + 3.day
    end
    if (!params[:turno12].nil? and params[:turno12]!="")
        @turno = 4
        @hora = params[:turno12]
        @fecha = @semana.to_date + 4.day
    end
    if (!params[:turno13].nil? and params[:turno13]!="")
        @turno = 2
        @hora = params[:turno13]
        @fecha = @semana.to_date + 5.day
    end
    if (!params[:turno14].nil? and params[:turno14]!="")
        @turno = 0
        @hora = params[:turno14]
        @fecha = @semana.to_date + 6.day
    end

    if params[:tipo_usuario] == "Usuario_nuevo"
      puts '78888888888888888888888888888888888'
     new_usuario = {
      body:
        {
          usuario:{
            email: @email_solicitante,
            password: @password_solicitante,
            password_confirmation: @password_solicitante,
            rol_id: 4
          },
          persona:{
            cedula: @cedula_solicitante,
            nombre: @nombre_solicitante,
            apellido: @apellido_solicitante,
            telefono: @telefono_solicitante,
            fecha_nacimiento: @fecha_nacimiento_solicitante,
            sexo_id: @sexo_solicitante
          }
        }
    }
     
    respuesta = self.class.post('/usuarios/create.json', new_usuario)
    usuario = self.class.get('/encontrar_usuario.json?email='+@email_solicitante)
    @paciente = self.class.get('/personas.json').last
    Respond_notice(respuesta)
    else
     usuario = self.class.get('/login_movil.json?email='+@email_usuario+'&password='+@password_usuario)
    end
    if params[:tipo_paciente]=="paciente_diferente"
      new_paciente = {
      body:
        {
          persona:{
            cedula: @cedula_paciente_nuevo,
            nombre: @nombre_paciente_nuevo,
            apellido: @apellido_paciente_nuevo,
            fecha_nacimiento: @fecha_nacimiento_nuevo,
            sexo_id: @sexo_paciente_nuevo
          }
        }
    }
      respuesta = self.class.post('/personas.json', new_paciente)
    Respond_notice(respuesta)
     @paciente = @cedula_paciente_nuevo# @paciente = self.class.get('/personas.json').last
    else
      puts '@@@@@@s@@@@@@@@@@@@@@@@@@@@@@@@'
      puts usuario
      puts '##############################3'
      @paciente = usuario["persona"]["cedula"]#@paciente = usuario["persona"]#
      puts @paciente
    end

   
    serv = self.class.get('/servicios/'+@servicio+'.json')
    puts "ssssssssssssssssssssssssssssssssssssssssssssssssssssss"
    puts @turno
    @turno_id = (serv["id"]*14) - @turno
    d = @fecha
    t = DateTime.parse(@hora) 
    @fechahora = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
 
    new_cita = {body:
                  {
                    cita:{
                      turno_id: @turno_id,
                      usuario_id: usuario["id"],
                      #persona_id: @paciente["id"],
                      fecha: @fechahora,
                      estatus: 1,
                      tipo_cita_id: @tipo_cita,
                      },
                      paciente_cedula: @paciente
                    }
                  }

  respuesta = self.class.post('/citas.json', new_cita)
    Respond_notice(respuesta)

    redirect_to '/home/index'

  end
  
  def solicitar
    
  end
  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(cita_params)

    respond_to do |format|
      if @cita.save
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1
  # PATCH/PUT /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'Cita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cita_params
      params.fetch(:cita, {})
    end
end
