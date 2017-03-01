class CategoriaServiciosController < ApplicationController
  before_action :set_categoria_servicio, only: [:show, :edit, :update, :destroy]

  # GET /categoria_servicios
  # GET /categoria_servicios.json
  def index
    @categoria_servicios = CategoriaServicio.all
  end

  # GET /categoria_servicios/1
  # GET /categoria_servicios/1.json
  def show
  end

  # GET /categoria_servicios/new
  def new
    @categoria_servicio = CategoriaServicio.new
  end

  # GET /categoria_servicios/1/edit
  def edit
  end

  # POST /categoria_servicios
  # POST /categoria_servicios.json
  def create
    @categoria_servicio = CategoriaServicio.new(categoria_servicio_params)

    respond_to do |format|
      if @categoria_servicio.save
        format.html { redirect_to @categoria_servicio, notice: 'Categoria servicio was successfully created.' }
        format.json { render :show, status: :created, location: @categoria_servicio }
      else
        format.html { render :new }
        format.json { render json: @categoria_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria_servicios/1
  # PATCH/PUT /categoria_servicios/1.json
  def update
    respond_to do |format|
      if @categoria_servicio.update(categoria_servicio_params)
        format.html { redirect_to @categoria_servicio, notice: 'Categoria servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria_servicio }
      else
        format.html { render :edit }
        format.json { render json: @categoria_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_servicios/1
  # DELETE /categoria_servicios/1.json
  def destroy
    @categoria_servicio.destroy
    respond_to do |format|
      format.html { redirect_to categoria_servicios_url, notice: 'Categoria servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_servicio
      @categoria_servicio = CategoriaServicio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_servicio_params
      params.require(:categoria_servicio).permit(:codigo, :nombre, :estatus)
    end
end
