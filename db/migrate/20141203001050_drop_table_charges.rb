class DropTableCharges < ActiveRecord::Migration
  def up
    drop_table :charges
  end
end
