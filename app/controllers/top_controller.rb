require 'bcrypt'

class TopController < ApplicationController
    def main
        #if session[:login_uid] != nil
            #logger.debug("aaaaaaaaaaaaaaaaaaaaaaaaaaa")
            #render "main"
        #else
            #logger.debug("bbbbbbbbbbbbbbbbbbbbbbbbbbb")
            #render "login_form"
        #end
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
    
    #def current_user
        #@current_user ||= User.find_by(uid: session[:login_uid])
    #end
    
    #def login_check
        #if current_user.nil?
          #redirect_to top_login_form_path
        #else
          #redirect_to root_path
        #end
        
    #end
end
