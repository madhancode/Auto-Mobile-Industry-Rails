class Request < ApplicationRecord
  has_many :buyers, class_name: "Shop", foreign_key: "buyer_id"
  has_many :suppliers, class_name: "Shop", foreign_key: "supplier_id"
  belongs_to :product

end
