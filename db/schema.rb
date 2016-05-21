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

ActiveRecord::Schema.define(version: 20160521105806) do

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

  create_table "attachments", force: :cascade do |t|
    t.string   "file"
    t.integer  "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attachments", ["goal_id"], name: "index_attachments_on_goal_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "project_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "goals", ["name", "project_id"], name: "index_goals_on_name_and_project_id", unique: true, using: :btree
  add_index "goals", ["project_id"], name: "index_goals_on_project_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "team_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
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
    t.string   "name"
    t.integer  "goal_id",              null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "position"
    t.text     "description_markdown"
    t.text     "description_html"
  end

  add_index "tasks", ["goal_id"], name: "index_tasks_on_goal_id", using: :btree

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
    t.string   "username"
  end

  add_index "users", ["email", "team_id"], name: "index_users_on_email_and_team_id", unique: true, using: :btree
  add_index "users", ["team_id"], name: "index_users_on_team_id", using: :btree

  add_foreign_key "assignments", "tasks", on_delete: :cascade
  add_foreign_key "assignments", "users", on_delete: :cascade
  add_foreign_key "attachments", "goals"
  add_foreign_key "goals", "projects", on_delete: :cascade
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id", on_delete: :cascade
  add_foreign_key "projects", "teams", on_delete: :cascade
  add_foreign_key "task_dependencies", "tasks", column: "dependency_task_id", on_delete: :cascade
  add_foreign_key "task_dependencies", "tasks", column: "dependent_task_id", on_delete: :cascade
  add_foreign_key "tasks", "goals", on_delete: :cascade
  add_foreign_key "users", "teams", on_delete: :cascade
end
