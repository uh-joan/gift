class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.boolean :completed
      t.float :lowerAmount
      t.float :higherAmount
      t.string :redeem
      t.string :expiry
      t.string :delivery
      t.text :shortDescription
      t.text :fullDescription
      t.text :note

      t.timestamps
    end
  end
end
