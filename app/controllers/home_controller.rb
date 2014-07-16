class HomeController < ApplicationController
	# default path no autenticated users
	def index
		render :layout => "public"
	end
	# default path to autenticated users
	def dashboard
		
	end
end
