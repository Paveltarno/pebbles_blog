class SessionsController < ApplicationController

  before_action :check_if_signed, except: :destroy

  def new
  end

  def create
    # Check credentials
    user = User.find_by(name: params[:name]).try(:authenticate, params[:password])

    if user
      sign_in(user)
      redirect_to root_path,
       flash: { success: "Login successful. Welcome #{user.name}!"} and return
    else
      redirect_to admin_door_path, flash: { danger: "Invalid username/password." }
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path, flash: { success: "Logout successful" }
  end

  private

    def check_if_signed
      if signed_in?
        redirect_to root_path, flash: { info: "You are already signed in." }
      end
    end

end