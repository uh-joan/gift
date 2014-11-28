class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :identifier, default:nil
      t.float :amount, default: nil
      t.string :senderName, default: nil
      t.string :senderEmail, default: nil
      t.string :recipientName, default: nil
      t.string :recipientEmail, default: nil
      t.string :message, default: nil
      t.string :status, default: nil
      t.string :vendor, default: nil
      t.boolean :completed, default: false
      t.boolean :confirmedPayment, default: false

      t.timestamps
    end
  end
end