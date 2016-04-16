class ApplicationController < ActionController::Base
    before_action :authorize
        # Prevent CSRF attacks by raising an exception.
        # For APIs, you may want to use :null_session instead.
        # protect_from_forgery with: :exception

    protected

    def authorize
        unless User.find_by(id: session[:user_id]) or User.count.zero?
            redirect_to login_url, notice: "Please log in"
        end
    end
end
