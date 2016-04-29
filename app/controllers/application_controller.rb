class ApplicationController < ActionController::Base
    before_action :authorize
    before_action :check_for_login

        # Prevent CSRF attacks by raising an exception.
        # For APIs, you may want to use :null_session instead.
        # protect_from_forgery with: :exception

   
       
    protected

    def check_for_login
        if session[:user_id] and User.find_by(id: session[:user_id])
            @logged_in_user_name = User.find_by(id: session[:user_id]).name
        end
    end

    def authorize
        unless User.find_by(id: session[:user_id]) or User.count.zero?
            redirect_to login_url, notice: "Please log in"
        end
    end
end
