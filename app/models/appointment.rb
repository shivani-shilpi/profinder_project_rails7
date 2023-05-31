class Appointment < ApplicationRecord
  belongs_to :pationt
  belongs_to :physician
end
