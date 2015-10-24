class TweetsController < ApplicationController

	def new
	end

	def create		
		@tweet = Tweet.new
		# Se crea un objecto completamente vacio, he incluye el user_id.
		@tweet.content = params[:content]
		@tweet.user_id = session[:user]
		# Con esto se le asigna el id del usuario que tiene la sesion abierta.
		user = User.find(session[:user])
		# Se crea una variable que busca el id del usuario que tiene la seccion abierta.
		if @tweet.save 
			redirect_to user
		else
           	flash[:notice] = @tweet.errors.full_messages
           	# La base de datos retorna un error, arriba es la manera para mostrar estos errores.
           	render "new"
		end
	end

	def destroy
		tweet = Tweet.find(params[:id])
		tweet.destroy
		user = User.find(session[:user])
		redirect_to user
	end

end
