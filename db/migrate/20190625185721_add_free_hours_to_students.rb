class AddFreeHoursToStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :crms, :free_credits, :float
  end
end
