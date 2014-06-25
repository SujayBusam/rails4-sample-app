class SessionsController < ApplicationController
  def new
  end

  def create
    # params contains the user information
    user_email = params[:session][:email]
    user_password = params[:session][:password]

    # Find the user
    user = User.find_by(email: user_email.downcase)

    if user && user.authenticate(user_password)
      # Sign the user in and redirect to user's show page
    else
      # Create an error message and re-render the signin form
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
