class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
       t.integer :customer_id,              null: false
       t.string :postal_code,               null: false
       t.string :address,                   null: false
       t.string :name,                      null: false
       t.boolean :payment,                  null: false
       t.boolean :delivery_charge,          null: false
       t.string :method_of_payment,         null: false

      t.timestamps
    end
  end
end
