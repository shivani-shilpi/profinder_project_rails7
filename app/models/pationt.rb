class Pationt < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
  accepts_nested_attributes_for :appointments
  accepts_nested_attributes_for :physicians
end
