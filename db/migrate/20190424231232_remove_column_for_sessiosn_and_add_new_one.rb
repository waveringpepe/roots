class RemoveColumnForSessiosnAndAddNewOne < ActiveRecord::Migration[5.2]
  def change
  	remove_column :sessions, :payment_id, :boolean
  	add_column :sessions, :payment_id, :string
  end
end
