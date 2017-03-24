class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception
    before_action :login

    include HTTParty
  
    base_uri 'http://192.168.2.14:3000/' #'https://alice-intranet-kevingn.c9users.io/'

  
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
    def login
      @login = self.class.base_uri  
    end
    
end
