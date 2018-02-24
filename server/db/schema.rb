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

ActiveRecord::Schema.define(version: 20180224002946) do

  create_table "applications", force: :cascade do |t|
    t.string "cur_company"
    t.string "linkedin_url"
    t.string "portfolio_url"
    t.text "add_info"
    t.string "gender"
    t.string "race"
    t.string "veteran_stat"
    t.string "disability_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_id"
    t.integer "user_id"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "status"
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "headquarters"
    t.string "size"
    t.string "founded"
    t.string "industry"
    t.string "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "company_id"
    t.string "job_description"
    t.string "employment_type"
    t.string "responsibilities"
    t.string "requirements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "name"
    t.integer "company_id"
    t.string "phone"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

end
