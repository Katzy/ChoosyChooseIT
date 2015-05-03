class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :chooseits

  accepts_nested_attributes_for :chooseits, :allow_destroy => true

  devise  :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def logged_in?
    self.guest_id == nil
  end

  def self.find_or_create_by_session_data(user_id, token)
    self.find_by(user_id) || self.where(:guest_id == token) || create_guest_user(token)
  end

  def create_guest_user(token)
    u = User.create(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com", :guest_id => token)
    u.save!(:validate => false)
    session[:guest_id] = u.id
    u
  end

  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def find_by_user_id(user_id)
    self.find_by(user_id)
  end

  private



  def find_by_uuid(guest_id)
    self.find_by(guest_id)
  end

end
