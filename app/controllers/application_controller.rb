class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  	protect_from_forgery with: :exception


  	def Url_WebServices

  		return 'http://192.168.1.103:3000/'
  		
  	end
end
