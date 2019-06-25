class CreateCrms < ActiveRecord::Migration[5.2]
  def change
    create_table :crms do |t|
      t.references :user
      t.string :private_status
      t.string :public_status
      t.float :credits_balance
      t.text :comment
      t.float :subscription_renewal
      t.timestamps
    end
  end
end
