class UsersController < ApplicationController
before_filter :authorize, :except => [:new, :create]
  def logged_in_and_new
  	'/new'
  end


  def new
  end

  def index
  	# Use the one below if you really want all, not just all those not logged in
  	# @users=User.all
  	# loads all but cuurent user so you can't delete yourself while logged in.
  	@users = User.where.not(id: current_user.id)
  end
  def edit
  	@user= User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	# render plain: "This is where the actual update will occur"
  	# @user.update(user_params)
  		if @user.save
  			@users = User.all
  			redirect_to '/index'

  			# render plain: "user modified"
   		else
  			render plain: "User didn't save properly"
  		end


  end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id 
  		redirect_to '/'
  	else
  		redirect_to '/signup'
  	end
  end


  def show
  	# render plain: "This is where we would show user info"
  	 @user = User.find(params[:id])
  	
  end
  def destroy
  	user = User.find(params[:id])
  	if user.id == session[:user_id]
  		session[:user_id] = nil
  		redirect_to '/index'
  	
  	elsif user.destroy
  		redirect_to '/index'
  	else
  		render plain: "User not deleted"
  	end
  end

  # fooling around with sending error messages
  def route_error
  	@route_err = "What the heck! I don't know that one, are you sure that's the address you wanted? Click me to return to the home page."
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :hometown, :password, :password_confirmation)
  	end
end
