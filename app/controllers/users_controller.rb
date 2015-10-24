class UsersController < ApplicationController
 # La clase se debe colocar en plural. (users, datos, ejercicios....)
    def show
       @user = User.find(session[:user])
       # A diferencia del where, find solo trae un registro.
       # Cuando no se le dice que vista va a renderisar se va a la carpeta user y archivo con el mismo nombre.
       @tweets = @user.tweets
    end

    def edit
       @user = User.find(session[:user]) 
    end

    def update
       @user = User.find(params[:id])
       @user.name = params[:name]
       @user.email = params[:email]
       @user.password = params[:password] if params[:password] != ""
       # Para que la contrase;a no la envien vacia sino con algun tipo de contrase;a
       @user.username = params[:username]     	

       if @user.save
        UserMailer.update(@user.name, @user.email).deliver
        redirect_to @user 
       else
       	render "edit"
       end 
    end

	def create
	   @user = User.new
	   @user.name = params[:name]
	   @user.email = params[:email]
	   @user.password = params[:password]

	   if @user.save
	   	session[:user] = @user.id
	   	UserMailer.welcome(@user.name, @user.email).deliver
	   	redirect_to @user
	   else
	   	render "/index"
	   end
	end

	def login
	   user = User.where(email: params[:email]).first 
	   # Para conocer el primer objeto de todo el array de correos que nos va a traer "where".
	   if user.nil?
	   	flash[:login] = "Este correo no existe."
       	redirect_to "/"
       else

        if user.password == params[:password]	
          session[:user] = user.id
          redirect_to user
        else
          flash[:login] = "Esa contraseña no coincide."
       	  redirect_to "/"
	    end
	   end  
	end

	def logout
	   session[:user] = nil
	   # No se coloca destroy porque elimina todo acerca del usuario.
	   redirect_to "/"
	end
end
