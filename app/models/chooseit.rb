class Chooseit < ActiveRecord::Base

  before_create :set_chooseit_link

  belongs_to :user
  has_many :chooseit_choices

  accepts_nested_attributes_for :chooseit_choices, :allow_destroy => true

  validates :title, :presence => true

  GENRES = ["People", "Places", "Things", "Furry Creatures", "Miscellaneous"]

  def to_param
    self.shortname
  end


  private

  def set_chooseit_link

    return self.short_name if self.short_name.present?
    try_short_name = SecureRandom.urlsafe_base64(16)
    while Chooseit.where(:short_name => try_short_name).any?
      try_short_name = SecureRandom.urlsafe_base64(16)
    end

    self.short_name = try_short_name
  end

end