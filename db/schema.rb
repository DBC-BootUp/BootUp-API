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

ActiveRecord::Schema.define(version: 20171207054255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "website"
    t.string "tech_field"
    t.boolean "has_apprenticeship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_skills", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "skill_id"
    t.index ["company_id"], name: "index_companies_skills_on_company_id"
    t.index ["skill_id"], name: "index_companies_skills_on_skill_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "job_title"
    t.boolean "referred"
    t.boolean "received_offer"
    t.text "notes"
    t.integer "difficulty_rating"
    t.integer "experience_rating"
    t.boolean "accepted_offer"
    t.boolean "phone_screen"
    t.text "phone_screen_details"
    t.boolean "tech_screen"
    t.text "tech_screen_details"
    t.boolean "take_home_challenge"
    t.text "take_home_challenge_details"
    t.boolean "onsite"
    t.text "onsite_details"
    t.boolean "whiteboarding"
    t.text "whiteboarding_details"
    t.text "negotiation_details"
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_interviews_on_company_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "interviews_skills", force: :cascade do |t|
    t.bigint "skill_id"
    t.bigint "interview_id"
    t.index ["interview_id"], name: "index_interviews_skills_on_interview_id"
    t.index ["skill_id"], name: "index_interviews_skills_on_skill_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "skill_id"
    t.index ["skill_id"], name: "index_skills_users_on_skill_id"
    t.index ["user_id"], name: "index_skills_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "cohort"
    t.string "location"
    t.string "email"
    t.string "linkedin_url"
    t.string "github_url"
    t.string "facebook_url"
    t.string "current_company"
    t.string "current_position"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.boolean "completed_registration", default: false
  end

end
