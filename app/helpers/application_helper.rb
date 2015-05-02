module ApplicationHelper


  def set_current_user
    current_user ||= User.find_or_create_by_session_data(session[:user_id], session_guest_id)
  end

  def session_guest_id
    return cookies.signed[:guest_id] if cookies.signed[:guest_id]
    cookies.permanent.signed[:guest_id] = SecureRandom.uuid
  end


end
