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

ActiveRecord::Schema[8.0].define(version: 2025_03_09_124042) do
  create_table "requirements", force: :cascade do |t|
    t.string "content"
    t.boolean "ethic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_uuid", limit: 36
    t.string "erc4ai_classes"
    t.integer "status", default: 0
    t.index ["session_uuid"], name: "index_requirements_on_session_uuid"
  end

  create_table "sessions", primary_key: "uuid", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_sessions_on_uuid", unique: true
  end

  add_foreign_key "requirements", "sessions", column: "session_uuid", primary_key: "uuid", on_delete: :nullify
end
