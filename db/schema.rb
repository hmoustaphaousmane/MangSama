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

ActiveRecord::Schema[7.0].define(version: 2023_07_05_191926) do
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

  create_table "chapters", force: :cascade do |t|
    t.bigint "tome_id", null: false
    t.integer "number"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tome_id"], name: "index_chapters_on_tome_id"
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

  create_table "images", force: :cascade do |t|
    t.string "image_url"
    t.bigint "chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_images_on_chapter_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "title"
    t.text "synopsis"
    t.integer "likes_count"
    t.integer "dislikes_count"
    t.bigint "category_id", null: false
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_mangas_on_category_id"
  end

  create_table "tomes", force: :cascade do |t|
    t.bigint "manga_id", null: false
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_tomes_on_manga_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appreciations", "mangas"
  add_foreign_key "appreciations", "users"
  add_foreign_key "chapters", "tomes"
  add_foreign_key "comments", "mangas"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "mangas"
  add_foreign_key "favorites", "users"
  add_foreign_key "images", "chapters"
  add_foreign_key "mangas", "categories"
  add_foreign_key "tomes", "mangas"
end
