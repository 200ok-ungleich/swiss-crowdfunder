class Supporter < ApplicationRecord
  belongs_to :order
  validates_presence_of :first_name, :last_name, :date_of_birth
end
