class Shop < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :users, dependent: :destroy
    has_many :requests, dependent: :destroy
end
