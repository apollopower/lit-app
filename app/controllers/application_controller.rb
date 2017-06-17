class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   before_action :authenticate_user!


   private

   def requires_logged_in
     if current_user == nil
       redirect_to root_url
     end
   end
   
   def current_user
     begin
       @current_user ||= User.find(session[:user_id]) if session[:user_id]
     rescue
       session[:user_id]= nil
       return nil
     end
   end

   helper_method :current_user
end
