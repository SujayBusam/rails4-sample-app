class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allow the use of Sessions helper functions in controllers
  include SessionsHelper

  private 
    def store_current_location
        store_location(current_page: true)
    end
    
end
