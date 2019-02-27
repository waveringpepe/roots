class RemoveColumnsForSubcriptionUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :processor, :string
  	remove_column :users, :processor_id, :string
  	remove_column :users, :card_token , :string
  end
end
