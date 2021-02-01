class UsersController < ApplicationController
    def new
        @user=User.new
    end
    #this is for signup page....
    def create
        @user=User.new user_params
        # redirect_to root_path, notice: "Logged in!"
        if @user.save
            session[:user_id]=@user.id
            redirect_to root_path, notice: "Logged in!"
        else
            render :new
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
