class AddInfoForProfessorsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :actual_country, :string
  	add_column :users, :teach_language, :string
  	add_column :users, :speak_language, :string
  	add_column :users, :carrear_id, :string
  	add_column :users, :university_id, :string
  	add_column :users, :experience_teaching, :string
  	add_column :users, :institutions_teach, :string
  	add_column :users, :certificate_id, :string
  	add_column :users, :type_student, :string
  	add_column :users, :years_teaching, :string
  end
end
