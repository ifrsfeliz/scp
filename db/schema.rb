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

ActiveRecord::Schema.define(version: 20150220181732) do

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "student_id"
    t.integer  "professor_id"
  end

  add_index "documents", ["professor_id"], name: "index_documents_on_professor_id"
  add_index "documents", ["student_id"], name: "index_documents_on_student_id"

  create_table "professors", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_attachments", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "nome"
    t.integer  "professor_id"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.string   "numero_suap"
    t.string   "nome_edital"
    t.string   "link_cnpq"
    t.datetime "ultima_verificacao"
    t.boolean  "auxilio_aipct"
    t.integer  "valor_aipct_cents"
    t.integer  "research_line_id"
    t.integer  "situation_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "projects", ["professor_id"], name: "index_projects_on_professor_id"
  add_index "projects", ["research_line_id"], name: "index_projects_on_research_line_id"
  add_index "projects", ["situation_id"], name: "index_projects_on_situation_id"

  create_table "research_groups", force: :cascade do |t|
    t.string   "nome"
    t.integer  "professor_id"
    t.date     "ultima_verificacao"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "research_groups", ["professor_id"], name: "index_research_groups_on_professor_id"

  create_table "research_lines", force: :cascade do |t|
    t.string   "nome"
    t.integer  "research_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "research_lines", ["research_group_id"], name: "index_research_lines_on_research_group_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "rg"
    t.string   "email"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_authorization",    default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
