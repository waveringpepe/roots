class RemoveColumnsFromUser < ActiveRecord::Migration[5.2]
  def change
 	remove_column :users, :card_brand, :string
  	remove_column :users, :card_last4, :string
  	remove_column :users, :card_exp_month , :string
  	remove_column :users, :card_exp_year , :string
  	remove_column :users, :stripe_subscription_id , :string
  	remove_column :users, :expires_at , :datetime

  end
end
