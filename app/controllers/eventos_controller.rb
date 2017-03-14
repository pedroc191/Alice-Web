class EventosController < ApplicationController
  before_action :set_evento, only: [ :edit, :update, :destroy]
  
  # GET /eventos
  # GET /eventos.json
  def index
    @categorias = self.class.get('/tipo_eventos.json')
    
    @eventos = self.class.get('/eventos.json')
  end

  def categoria
    
    @categorias = self.class.get('/tipo_eventos.json')
    
    @categorias.each do |categoria|

      if params[:slug] == categoria["slug"]
      
        @eventos = categoria["eventos"]
        
        break
      
      end
    
    end

  end
  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end


  def ver
    @evento = self.class.get('/eventos/'+params[:slug]+'.json')
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.fetch(:evento, {})
    end
end
