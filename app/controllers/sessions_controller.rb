class SessionsController < ApplicationController
    
    def new
        redirect_to articles_path if logged_in?
    end

    def create
        user = User.find_by(email: params[:session] [:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Login Successful!"
            redirect_to articles_path
        else
            flash.now[:alert] = "There was something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end

end