class Plant < ApplicationRecord
    validates :name, :price, presence: true
    has_one_attached :image
    has_many :notes, as: :notable
    acts_as_list
end
