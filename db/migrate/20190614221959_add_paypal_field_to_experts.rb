class AddPaypalFieldToExperts < ActiveRecord::Migration[5.2]
  def change
  	add_column :expert_profiles, :paypal_account, :string
  end
end
