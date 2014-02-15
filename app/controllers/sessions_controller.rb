class SessionsController < ApplicationController
  respond_to :json

  skip_before_filter :verify_authenticity_token
  def login
  	user = User.authorize(params[:username], params[:password])
  	if user
  		session[:user_id] = user.id
  		render json: user, status: :ok, nothing: true
  	else
  		render json: {error: 'Authentication failure'}, status: :forbidden, nothing: true
  	end
  end
  def logout
  	session[:user_id] = nil
  	render status: :ok, nothing: true
  end
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
  	   render json: @current_user, status: :ok, nothing: true
    else
        render status: :not_found, nothing: true
    end
  end
  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:username, :password)
    end
end
