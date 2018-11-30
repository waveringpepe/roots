class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :skype, :string
    add_column :users, :phone_number, :integer
    add_column :users, :city_id, :string
    add_column :users, :time_zone, :datetime
    add_column :users, :birth_date, :date
    add_column :users, :language_id, :string
    add_column :users, :reason_id, :string
    add_column :users, :level, :integer
    add_column :users, :start_id, :string
    add_column :users, :experience, :text
    add_column :users, :schedule, :text
    add_column :users, :reference, :string
    add_column :users, :promo_code, :string
  end
end
