class Image < ApplicationRecord
    has_one_attached :attachment
    has_many :notes, as: :notable
end
