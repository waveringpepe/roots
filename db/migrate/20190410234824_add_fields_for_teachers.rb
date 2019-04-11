class AddFieldsForTeachers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :teacher_description, :string
  end
end
