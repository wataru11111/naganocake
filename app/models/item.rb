class Item < ApplicationRecord
   has_many :cart_items
   has_many :order_products
   has_one_attached :image


    def with_tax_price
     (price * 1.1).ceil
    end



 def get_image(width, height)
          unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
          end
     image
 end

end
