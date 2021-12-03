class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def show
        
        @articles = @user.articles
    end

    def create
        @user = User.new(users_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "User Created!"
            redirect_to articles_path
        else
            render "new"
        end
    end

    def edit
        @articles = @user.articles
    end

    def update
        if @user.update(users_params)
            flash[:notice] = "User Updated!"
            redirect_to @user
        else
            render "edit"
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def users_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_same_user
        if current_user != @user
            flash[:alert] = "You can only edit your own profile"
            redirect_to user_path
        end
    end


end