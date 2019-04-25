class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :user_id
      t.string :student_id
      t.string :language_id
      t.string :class_type_id
      t.datetime :date_id
      t.decimal :time_duration_id
      t.string :status_id
      t.string :payment_id

      t.timestamps
    end
  end
end
