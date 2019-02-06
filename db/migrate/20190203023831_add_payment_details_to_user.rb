class AddPaymentDetailsToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :stripe_id, :string
  	add_column :users, :stripe_subscription_id, :string
  	add_column :users, :expires_at, :datetime
  end
end
