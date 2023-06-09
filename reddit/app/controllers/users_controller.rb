class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def new 
        @user = User.new
        render :new
    end

    def create 
        @user = User.new(user_params)

        if @user.save 
            redirect_to users_url 
        else
            flash[:errors] = @user.errors.full_messages
            render :new 
        end

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_url(@user)
        else
          render :edit
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end




    private 
    def user_params 
        params.require(:user).permit(:username,:password)
    end
end
