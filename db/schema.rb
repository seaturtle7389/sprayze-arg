# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_19_215126) do
  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crypto_coins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 50, default: "", null: false
    t.string "username"
    t.string "discriminator"
    t.string "avatar_url"
    t.boolean "admin", default: false, null: false
    t.boolean "sprayze_member", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "value_adjustments", force: :cascade do |t|
    t.integer "value_portfolio_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "historical_value"
    t.integer "user_id"
    t.index ["user_id"], name: "index_value_adjustments_on_user_id"
    t.index ["value_portfolio_id"], name: "index_value_adjustments_on_value_portfolio_id"
  end

  create_table "value_portfolios", force: :cascade do |t|
    t.float "amount"
    t.string "growth_rate"
    t.bigint "investment_id"
    t.string "investment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["investment_type", "investment_id"], name: "index_value_portfolios_on_investment_type_and_investment_id"
  end

end
