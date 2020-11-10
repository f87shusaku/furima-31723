class CreateMultipleAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :multiple_addresses do |t|
      t.string     :postal_code,    null: false
      t.string     :municipalities, null: false
      t.string     :address,        null: false
      t.string     :phone_number,   null: false
      t.string     :building
      t.integer    :prefecture_id,  null: false
      t.references :order,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
