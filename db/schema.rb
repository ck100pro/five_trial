# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_31_113726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_boards_on_status", unique: true
    t.index ["title"], name: "index_boards_on_title", unique: true
  end

  create_table "card_tags", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_tags_on_card_id"
    t.index ["tag_id"], name: "index_card_tags_on_tag_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "position"
    t.boolean "status", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_cards_on_list_id"
    t.index ["title"], name: "index_cards_on_title", unique: true
  end

  create_table "lists", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "position"
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
    t.index ["title"], name: "index_lists_on_title", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "color", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "board_id", null: false
    t.index ["board_id"], name: "index_tags_on_board_id"
    t.index ["title"], name: "index_tags_on_title", unique: true
  end

  create_table "user_boards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_user_boards_on_board_id"
    t.index ["user_id"], name: "index_user_boards_on_user_id"
  end

  create_table "user_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_user_cards_on_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_password", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["user_password"], name: "index_users_on_user_password", unique: true
  end

  add_foreign_key "card_tags", "cards"
  add_foreign_key "card_tags", "tags"
  add_foreign_key "cards", "lists"
  add_foreign_key "lists", "boards"
  add_foreign_key "user_boards", "boards"
  add_foreign_key "user_boards", "users"
  add_foreign_key "user_cards", "cards"
  add_foreign_key "user_cards", "users"
end
