class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :chooseits
  has_many :chooseit_responses, dependent: :destroy
  has_many :chooseit_choices, through: :chooseit_responses

  accepts_nested_attributes_for :chooseits, :allow_destroy => true

  devise  :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # def logged_in?
  #   self.guest_id == nil
  # end

  def voted_for?(chooseit)
    chooseit_choices.any? { |choice| choice.chooseit == chooseit }
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

  private


end
