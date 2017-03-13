class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception


  	def Url_WebServices
    		return 'http://192.168.0.105:3000/'
  	end

    def eventos
        @url = Url_WebServices()
        @categorias1 = HTTParty.get(@url+'tipo_evento.json')
        if params[:id].nil?
          @eventos1 = HTTParty.get(@url+'eventos.json')
        else
          @eventos1 = HTTParty.get(@url+'eventos.json?id='+params[:id])
        end
        return @eventos1
    end

  	def Respond_notice(response)

  		case response.code
  			when 201
    			puts "All good!"
  			when 404
    			puts "O noes not found!"
 			when 500...600
    			puts "ZOMG ERROR #{response.code}"
		end
  		
  	end
end
