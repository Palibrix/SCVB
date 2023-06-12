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

ActiveRecord::Schema[7.0].define(version: 2023_06_10_202331) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specialization"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_technologies", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_technologies_on_project_id"
    t.index ["technology_id"], name: "index_project_technologies_on_technology_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "term"
    t.text "additions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.string "tool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worker_educations", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "education_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["education_id"], name: "index_worker_educations_on_education_id"
    t.index ["worker_id"], name: "index_worker_educations_on_worker_id"
  end

  create_table "worker_languages", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_worker_languages_on_language_id"
    t.index ["worker_id"], name: "index_worker_languages_on_worker_id"
  end

  create_table "worker_projects", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_worker_projects_on_project_id"
    t.index ["worker_id"], name: "index_worker_projects_on_worker_id"
  end

  create_table "worker_qualities", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "quality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quality_id"], name: "index_worker_qualities_on_quality_id"
    t.index ["worker_id"], name: "index_worker_qualities_on_worker_id"
  end

  create_table "worker_technologies", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["technology_id"], name: "index_worker_technologies_on_technology_id"
    t.index ["worker_id"], name: "index_worker_technologies_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "occupation"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "project_technologies", "projects"
  add_foreign_key "project_technologies", "technologies"
  add_foreign_key "worker_educations", "educations"
  add_foreign_key "worker_educations", "workers"
  add_foreign_key "worker_languages", "languages"
  add_foreign_key "worker_languages", "workers"
  add_foreign_key "worker_projects", "projects"
  add_foreign_key "worker_projects", "workers"
  add_foreign_key "worker_qualities", "qualities"
  add_foreign_key "worker_qualities", "workers"
  add_foreign_key "worker_technologies", "technologies"
  add_foreign_key "worker_technologies", "workers"
end
