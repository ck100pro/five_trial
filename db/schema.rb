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

ActiveRecord::Schema.define(version: 2020_01_30_132750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_boards_on_status"
    t.index ["title"], name: "index_boards_on_title"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "position"
    t.boolean "status", default: true, null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_cards_on_list_id"
    t.index ["title"], name: "index_cards_on_title"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "position"
    t.bigint "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
    t.index ["title"], name: "index_lists_on_title"
  end

  add_foreign_key "cards", "lists"
  add_foreign_key "lists", "boards"
end
