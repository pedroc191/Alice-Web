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

  def registrar
    @fecha = params[:week]
    @servicio  = params[:slug]
    @tipo_usuario = params[:tipo_usuario]
    @tipo_cita = params[:tipo_cita]
    @email = params[:email]
    @password = params[:password]
    @cedula_solicitante = params[:cedula_solicitante]
    @nombre_solicitante = params[:nombre_solicitante]
    @apellido_solicitante = params[:apellido_solicitante]
    @tipo_paciente = params[:paciente_solicita]
    @sexo_paciente_usuario = params[:sexo_paciente_usuario]
    @sexo_paciente_nuevo = params[:sexo_paciente_nuevo]

     contacto = {
      body:
        {
          usuario:{
            email: @email,
            password: @password,
            password_confirmation: @password,
            rol_id: 1
          },
          persona:{
            cedula: @cedula_solicitante,
            nombre: @nombre_solicitante,
            apellido: @apellido_solicitante,
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
