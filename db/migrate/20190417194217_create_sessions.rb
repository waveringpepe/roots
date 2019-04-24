class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.integer :student_id
      t.string :language_id
      t.string :class_type_id
      t.datetime :date_id
      t.decimal :time_duration_id
      t.string :status_id
      t.boolean :payment_id
      t.timestamps
    end
  end
end
