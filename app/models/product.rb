class Product < ApplicationRecord
    belongs_to :shop
    has_many :requests, dependent: :destroy

    validates :name, presence: true, length: {minimum: 2}
    validates :quantity, presence: true, numericality: { only_integer: true }
end
