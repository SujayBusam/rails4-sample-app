class SessionsController < ApplicationController
  def new
  end

  def create
    # params contains the user information
    user_email = params[:email]
    user_password = params[:password]

    # Find the user
    user = User.find_by(email: user_email.downcase)

    if user && user.authenticate(user_password)
      # Sign the user in and redirect back or to user's show page
      sign_in user
      redirect_back_or user
    else
      # Create an error message and re-render the signin form
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
