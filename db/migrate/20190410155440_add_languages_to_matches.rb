class AddLanguagesToMatches < ActiveRecord::Migration[5.2]
  def change
  	add_column :matches, :language_id, :string
  end
end
