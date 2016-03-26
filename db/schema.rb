# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160325233023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "task_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "project_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "jobs", ["name", "project_id"], name: "index_jobs_on_name_and_project_id", unique: true, using: :btree
  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["name", "team_id"], name: "index_projects_on_name_and_team_id", unique: true, using: :btree
  add_index "projects", ["team_id"], name: "index_projects_on_team_id", using: :btree

  create_table "task_dependencies", force: :cascade do |t|
    t.integer  "dependent_task_id",  null: false
    t.integer  "dependency_task_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "task_dependencies", ["dependency_task_id"], name: "index_task_dependencies_on_dependency_task_id", using: :btree
  add_index "task_dependencies", ["dependent_task_id"], name: "index_task_dependencies_on_dependent_task_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["job_id"], name: "index_tasks_on_job_id", using: :btree
  add_index "tasks", ["name", "job_id"], name: "index_tasks_on_name_and_job_id", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "subdomain",  null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["subdomain"], name: "index_teams_on_subdomain", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "team_id",                         null: false
  end

  add_index "users", ["email", "team_id"], name: "index_users_on_email_and_team_id", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  add_foreign_key "assignments", "tasks", on_delete: :cascade
  add_foreign_key "assignments", "users", on_delete: :cascade
  add_foreign_key "jobs", "projects", on_delete: :cascade
  add_foreign_key "projects", "teams", on_delete: :cascade
  add_foreign_key "task_dependencies", "tasks", column: "dependency_task_id", on_delete: :cascade
  add_foreign_key "task_dependencies", "tasks", column: "dependent_task_id", on_delete: :cascade
  add_foreign_key "tasks", "jobs", on_delete: :cascade
  add_foreign_key "users", "teams", on_delete: :cascade
end
