class ApplicationController < ActionController::Base
    def L5
        session[:c] ||= 0
        session[:c] = session[:c].to_i + 1
        render plain: session[:c]
    end
end
