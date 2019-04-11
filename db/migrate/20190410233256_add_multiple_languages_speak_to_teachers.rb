class AddMultipleLanguagesSpeakToTeachers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :speak_language_2, :string
  end
end
