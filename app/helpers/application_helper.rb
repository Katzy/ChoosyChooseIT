module ApplicationHelper

  def current_user
      @current_user || User.find_or_create_by_session_data(session[:user_id], anonymous_token)
  end

  def anonymous_token
    return cookies.signed[:guest_id] if session.key?(:guest_id)
    cookies.permanent.signed[:guest_id] = SecureRandom.uuid
  end




end
