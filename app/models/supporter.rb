class Supporter < ApplicationRecord
  belongs_to :order
  validates_presence_of :first_name, :last_name, :street,
    :postal_code, :country, :city, :email

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validate :date_of_birth, :is_old_enough?

  def is_old_enough?
    unless date_of_birth.is_a?(Date)
      errors.add(:date_of_birth, I18n.t("supporter.validation.is_not_a_date"))
      return
    end
    unless Date.today.year - self.date_of_birth.year >= 18
      errors.add(:date_of_birth, I18n.t("supporter.validation.not_old_enough"))
    end
  end

end
