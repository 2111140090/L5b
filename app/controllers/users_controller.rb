require 'bcrypt'

class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        #if not User.find_by(uid: params[:user][:uid])
        #    pass = params[:user][:pass]
        #    hashpass = BCrypt::Password.create(pass)
        #    @user = User.new(uid: params[:user][:uid], pass: hashpass)
        #    @user.save
        #end
        #redirect_to root_path
        @user = User.new(
            uid: params[:user][:uid],
            password: params[:user][:password],
            password_confirmation: params[:user][:password_confirmation])
        if @user.save
            redirect_to users_path
        else
            render 'new'
        end
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
end
