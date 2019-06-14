# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_14_221959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.bigint "user_id"
    t.string "stripe_customer_token"
    t.integer "amount"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "expert_profiles", force: :cascade do |t|
    t.string "status_id"
    t.string "bank_account_number"
    t.string "bank_account_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bank_account_user_name"
    t.string "paypal_account"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "user_id"
    t.string "student_id"
    t.string "language_id"
    t.string "class_type_id"
    t.datetime "date_id"
    t.decimal "time_duration_id"
    t.string "status_id"
    t.string "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.string "skype"
    t.string "city_id"
    t.date "birth_date"
    t.string "language_id"
    t.string "reason_id"
    t.integer "level"
    t.string "start_id"
    t.text "experience"
    t.text "schedule"
    t.string "reference"
    t.string "promo_code"
    t.string "phone_number"
    t.string "time_zone"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "plan_id"
    t.string "stripe_customer_token"
    t.string "country"
    t.string "actual_country"
    t.string "teach_language"
    t.string "speak_language"
    t.string "carrear_id"
    t.string "university_id"
    t.string "experience_teaching"
    t.string "institutions_teach"
    t.string "certificate_id"
    t.string "type_student"
    t.string "years_teaching"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.string "stripe_subscription_id"
    t.datetime "expires_at"
    t.string "speak_language_2"
    t.string "teacher_description"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "charges", "users"
end
