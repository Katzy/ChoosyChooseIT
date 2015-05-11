class Chooseit < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  before_create :set_chooseit_link

  belongs_to :user
  has_many :chooseit_choices, dependent: :destroy
  has_many :chooseit_responses

  accepts_nested_attributes_for :chooseit_choices, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :presence => true
  validates :chooseit_choices, :presence => true

  GENRES = ["People", "Places", "Things", "Furry Creatures", "Miscellaneous"]

  # def chooseit_choices
  #   [@chooseit_choice_1 = ChooseitChoice.new, @chooseit_choice_2 = ChooseitChoice.new]
  # end
  # def to_param
  #   self.short_name
  # end

  def normalized_votes_for(option)
    votes_totals == 0 ? 0 : (option.chooseit_responses.count.to_f / votes_totals) * 100
  end

  def votes_totals
    self.chooseit_choices.inject(0) {|total, option| total + option.chooseit_responses.count }
  end

  private

  def set_chooseit_link

    return self.short_name if self.short_name.present?
    try_short_name = SecureRandom.urlsafe_base64(8)
    while Chooseit.where(:short_name => try_short_name).any?
      try_short_name = SecureRandom.urlsafe_base64(8)
    end

    self.short_name = try_short_name
  end

end