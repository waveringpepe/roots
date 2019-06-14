class CreateExpertProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :expert_profiles do |t|
      t.string :status_id
      t.string :bank_account_number
      t.string :bank_account_name
      t.integer	:user_id
      t.timestamps
    end
  end
end
