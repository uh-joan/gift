class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :identifier, default: nil
      t.string :stripeToken, default: nil
      # t.references :purchase, index: true
      t.string :currency, default: nil
      t.integer :amount, default: nil
      t.string :email, default: nil
      t.boolean :completed, default: false

      t.timestamps null:false
    end
  end
end