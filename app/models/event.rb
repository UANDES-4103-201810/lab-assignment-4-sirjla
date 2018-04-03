class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets

  validate :same_place
  validate :date_cannot_be_in_the_past


  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def same_place
    ev = Event.where(:place => place).where(:start_date => start_date).count()
    if ev > 1
      errors.add(:place, "can't have 2 events at the same place and time")
    end
  end

end