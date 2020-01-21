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

ActiveRecord::Schema.define(version: 2020_01_12_200709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.integer "primaryNumber"
    t.boolean "active"
    t.string "currentTeam"
    t.string "primaryPosition"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "puckhead_game_players", force: :cascade do |t|
    t.bigint "puckhead_game_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_puckhead_game_players_on_player_id"
    t.index ["puckhead_game_id"], name: "index_puckhead_game_players_on_puckhead_game_id"
  end

  create_table "puckhead_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_puckhead_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "puckhead_total_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "puckhead_game_players", "players"
  add_foreign_key "puckhead_game_players", "puckhead_games"
  add_foreign_key "puckhead_games", "users"
end
