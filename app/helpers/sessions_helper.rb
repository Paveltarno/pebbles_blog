module SessionsHelper

  def sign_in(user)
    token = User.generate_token
    user.update_attribute(:sign_in_token, token)
    cookies.permanent.signed[:log_in_token] = token
    self.current_user = user
  end

  def sign_out(user)
    cookies.delete(:log_in_token)
    user.update(sign_in_token: nil)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_sign_in_token(cookies.signed[:log_in_token])
  end

end