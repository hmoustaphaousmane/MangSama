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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_181550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appreciations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "manga_id", null: false
    t.boolean "liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_appreciations_on_manga_id"
    t.index ["user_id"], name: "index_appreciations_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.bigint "manga_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["manga_id"], name: "index_categorizations_on_manga_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.string "name"
    t.string "image_url"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_characters_on_manga_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "manga_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_comments_on_manga_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "manga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_favorites_on_manga_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "url"
    t.string "author_name"
    t.string "title"
    t.text "synopsis"
    t.integer "likes_count"
    t.integer "dislikes_count"
    t.string "cover_image"
    t.integer "volumes"
    t.integer "chapters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.integer "reading"
    t.integer "completed"
    t.integer "dropped"
    t.integer "on_hold"
    t.integer "plan_to_read"
    t.integer "total"
    t.integer "score"
    t.integer "votes"
    t.integer "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_statistics_on_manga_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appreciations", "mangas"
  add_foreign_key "appreciations", "users"
  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "mangas"
  add_foreign_key "characters", "mangas"
  add_foreign_key "comments", "mangas"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "mangas"
  add_foreign_key "favorites", "users"
  add_foreign_key "statistics", "mangas"
end
