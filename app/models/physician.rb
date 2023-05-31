class Physician < ApplicationRecord
  has_many :appointments
  has_many :pationts, through: :appointments
end
