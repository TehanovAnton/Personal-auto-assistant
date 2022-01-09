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

ActiveRecord::Schema.define(version: 2022_01_09_154843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_consumable_values", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "consumable_id", null: false
    t.integer "value", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id", "consumable_id"], name: "index_car_consumable_values_on_car_id_and_consumable_id", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.integer "user_id"
    t.string "model", default: "a12", null: false
    t.integer "year_production", default: 2000, null: false
    t.integer "engine_volume", default: 1, null: false
    t.integer "mileage", default: 0, null: false
    t.string "body_type", default: "sedan", null: false
    t.string "maker", default: "bmw", null: false
    t.string "vin", default: "123asdfaase123", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fuel_type", default: 0, null: false
    t.integer "transmission_type", default: 0, null: false
    t.index ["vin"], name: "index_cars_on_vin", unique: true
  end

  create_table "cars_owners_documents", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "document_id", null: false
    t.date "issue_date", default: "2021-01-01", null: false
    t.integer "term_of_validity", default: 29, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "document_id"], name: "index_cars_owners_documents_on_user_id_and_document_id", unique: true
  end

  create_table "cars_parts", force: :cascade do |t|
    t.integer "car_id", null: false
    t.integer "part_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id", "part_id"], name: "index_cars_parts_on_car_id_and_part_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "cities_organizations", id: false, force: :cascade do |t|
    t.integer "city_id"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "commentable_id"
    t.string "commentable_type"
  end

  create_table "consumables", force: :cascade do |t|
    t.integer "name", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_consumables_on_name", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "name", default: 0, null: false
  end

  create_table "guests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "services_work_id", null: false
    t.integer "mileage", null: false
    t.index ["services_work_id"], name: "index_orders_on_services_work_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.integer "service_owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_organizations_on_address", unique: true
    t.index ["email"], name: "index_organizations_on_email", unique: true
    t.index ["phone_number"], name: "index_organizations_on_phone_number", unique: true
  end

  create_table "organizations_services_works_prices", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "service_id", null: false
    t.integer "service_work_id", null: false
    t.integer "price", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id", "service_id", "service_work_id"], name: "organization_service_servicework_price_index", unique: true
  end

  create_table "organizations_works", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "work_id", null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_organizations_works_on_organization_id"
    t.index ["work_id"], name: "index_organizations_works_on_work_id"
  end

  create_table "parts", force: :cascade do |t|
    t.integer "name", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_parts_on_name", unique: true
  end

  create_table "service_owners", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", default: "0", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organization_id", null: false
    t.index ["name"], name: "index_services_on_name", unique: true
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  create_table "services_works", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_services_works_on_service_id"
    t.index ["work_id"], name: "index_services_works_on_work_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_works_on_category_id"
    t.index ["title"], name: "index_works_on_title", unique: true
  end

  add_foreign_key "car_consumable_values", "cars", on_delete: :cascade
  add_foreign_key "car_consumable_values", "consumables", on_delete: :cascade
  add_foreign_key "cars", "users", on_delete: :cascade
  add_foreign_key "cars_owners_documents", "documents", on_delete: :cascade
  add_foreign_key "cars_owners_documents", "users", on_delete: :cascade
  add_foreign_key "cars_parts", "cars", on_delete: :cascade
  add_foreign_key "cars_parts", "parts", on_delete: :cascade
  add_foreign_key "cities_organizations", "cities", on_delete: :cascade
  add_foreign_key "cities_organizations", "organizations", on_delete: :cascade
  add_foreign_key "comments", "users", on_delete: :cascade
  add_foreign_key "orders", "services_works", on_delete: :cascade
  add_foreign_key "organizations", "users", column: "service_owner_id", on_delete: :cascade
  add_foreign_key "organizations_services_works_prices", "organizations", on_delete: :cascade
  add_foreign_key "organizations_services_works_prices", "services", on_delete: :cascade
  add_foreign_key "organizations_services_works_prices", "works", column: "service_work_id", on_delete: :cascade
  add_foreign_key "organizations_works", "organizations", on_delete: :cascade
  add_foreign_key "organizations_works", "works", on_delete: :cascade
  add_foreign_key "services", "organizations", on_delete: :cascade
  add_foreign_key "services_works", "services", on_delete: :cascade
  add_foreign_key "services_works", "works", on_delete: :cascade
  add_foreign_key "works", "categories", on_delete: :cascade
end
