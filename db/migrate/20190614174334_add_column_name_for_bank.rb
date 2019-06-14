class AddColumnNameForBank < ActiveRecord::Migration[5.2]
  def change
  	add_column :expert_profiles, :bank_account_user_name, :string
  end
end
