class EventosController < ApplicationController
  before_action :set_evento, only: [ :edit, :update, :destroy]
  before_action :eventos, only: [:index]

  # GET /eventos
  # GET /eventos.json
  def index

   #  @url = Url_WebServices()
   #   @categorias = HTTParty.get(@url+'tipo_evento.json')
   # if params[:id].nil?
   #   @eventos = HTTParty.get(@url+'eventos.json')
   # else
   #   @eventos = HTTParty.get(@url+'eventos.json?id='+params[:id])
   # end
   @eventos = @eventos1
   @categorias = @categorias1
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
  end


  def ver
    @url = Url_WebServices()
    @evento = HTTParty.get(@url+'eventos/'+params[:slug].to_s+'.json')
    
    #@eventos.each do |evento|

     # if evento["slug"] == params[:slug]
        
      #  @evento = evento
     # end
    #end
    #@evento = $eventos.find_by(index_by params[:id])
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
