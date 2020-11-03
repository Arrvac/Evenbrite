class Event < ApplicationRecord
  after_create :subscribe_event_mail
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validates :duration, presence: true, numericality: true, if: :multiple_of_five?
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true,  :inclusion => 1..1000
  validates :location, presence: true

  def multiple_of_five?
    res = self.duration % 5
     if res.positive?
       errors.add(:base, 'erreur date de durée')
       false
     end
  end

  def subscribe_event_mail
    UserMailer.subscribe_mail(self).deliver_now
  end
end
