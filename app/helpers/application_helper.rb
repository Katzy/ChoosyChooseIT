module ApplicationHelper

  # def current_user
  #   begin
  #     @current_user = User.find(session[:user_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @
  #   || User.find_or_create_by_session_data(session[:user_id], anonymous_token)
  # end
  def current_or_guest_user
    if current_user
      if cookies.signed[:guest_token]
        logging_in
        session[:guest_token] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.find_by!(guest_id: (cookies.signed[:guest_token] ||= create_guest_user.guest_id))

  rescue ActiveRecord::RecordNotFound
    cookies.delete :guest_token
    guest_user
  end

  private

  def logging_in

    current_user.guest_id = nil
    current_user.save
  end

  def create_guest_user
    cookies.permanent.signed[:guest_token] = SecureRandom.uuid
    u = User.create(:guest_id => cookies.permanent.signed[:guest_token])
    # u.skip_confirmation!
    u.save!(:validate => false)
    u
  end


end
