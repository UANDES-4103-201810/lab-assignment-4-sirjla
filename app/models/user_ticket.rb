class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validate :ticket_on_time_sale
  validate :debt

  def ticket_on_time_sale
    ev = Event.find(ticket.event.id)
    if ev.start_date < Date.today()
      errors.add(:base, "can't sell a ticket for a past event")
    end
  end

  def debt
    de = UserTicket.where(:user => user).where(:paid => false).count()
    if de >= 1
      errors.add(:base, "first pay your debts")
    end
  end
end
