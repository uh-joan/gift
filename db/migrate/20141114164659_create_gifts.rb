class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title, null:false
      t.boolean :completed, default: false
      t.float :lowerAmount, default: nil
      t.float :higherAmount, default: nil
      t.string :redeem, default: nil
      t.string :expiry, default: nil
      t.string :delivery, default: nil
      t.text :shortDescription, default: nil
      t.text :fullDescription, default: nil
      t.text :note, default: nil

      t.timestamps
    end
  end
end
