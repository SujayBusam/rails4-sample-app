module SessionsHelper

  def sign_in(user)
    # Create a new token
    remember_token = User.new_remember_token

    # Place raw token in browser cookies
    cookies.permanent[:remember_token] = remember_token
    
    # Save hashed token to the database
    user.update_attribute(:remember_token, User.digest(remember_token))
    
    # Useful if you want to sign in without a redirect
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end
end
