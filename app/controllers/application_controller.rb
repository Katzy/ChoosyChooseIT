class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => :receive_guest

  helper_method :current_or_guest_user

  before_action :current_or_guest_user

  def current_or_guest_user
    if current_user
      if session[:guest_id] && session[:guest_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:destroy)
        session[:guest_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_id] = nil
    guest_user if with_retry
  end

  def logged_in?
    current_user != nil
  end

  private

  def create_guest_user
    u = User.create(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(:validate => false)
    session[:guest_id] = u.id
    u
  end

# def self.find_or_create_by_session_data(user_id, guest_id)
  #   self.find_by(user_id) || self.find_by(guest_id) || create(:guest_id => guest_id, :validate => false)
  # end
  # def current_user
  #   current_user ||= User.find_or_create_by_session_data(session[:user_id], session_guest_id)
  # end

end
