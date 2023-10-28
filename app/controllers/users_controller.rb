class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(uid: params[:user][:uid], pass: params[:user][:pass])
        @user.save
        redirect_to root_path
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
