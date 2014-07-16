class ProfilesController < ApplicationController
	before_action :authenticate_user!

	# Funcion que obtiene todos los perfiles
	def index
		@profiles = Profile.all
	end

	# Funcion para obtener y desplegar la informacion de un registro en BD.
	def show
		@profile = Profile.find(params[:id])
	end

	# Funcion que crea un perfil
	def new
		@profile = Profile.new
	end

	# Funcion que edita un perfil
	def edit
		@profile = Profile.find_by_user_id(current_user.id)
		if @profile.nil?
			redirect_to new_profile_path
		end
	end

	# Funcion que crea el registro en la BD
	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		if @profile.save
			redirect_to edit_profile_path(:id => current_user.id)
		else
			render 'new'
		end
	end

	# Funcion que actualiza un registro en la BD
	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			redirect_to edit_profile_path(:id => current_user.id)
		else
			render 'edit'
		end
	end

	# Funcion encargada de eliminar un perfil
	def destroy
		@profile = Profile.find(params[:id])
		@profile.destroy
		redirect_to profiles_path
	end

	private

	# Define los parametros aceptados, strongparameters
	def profile_params
		params.require(:profile).permit(:name, :lastname, :nickname, :twitter_profile, :facebook_profile, :instagram_profile)
	end

end
