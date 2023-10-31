require 'bcrypt'

class TopController < ApplicationController
    def main
        render "login_form"
    end

    def login
        user = User.find_by(uid: params[:uid])
        login_password = BCrypt::Password.new(user.pass)
        if login_password == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        end
    end
    
    def logout
        logger.debug(session[:login_uid])
        session[:login_uid] = nil
        redirect_to root_path
    end
end
