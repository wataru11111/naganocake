class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :item

    def subtotal
     purchase_price * quantity
    end
end
