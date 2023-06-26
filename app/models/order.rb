class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  enum method_of_payment: { credit_card: 0, transfer: 1 }

  def subtotal
    item.with_tax_price * amount
  end
end
