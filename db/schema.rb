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

ActiveRecord::Schema.define(version: 20160425165002) do

  create_table "areas", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "student_id",        limit: 4
    t.integer  "researcher_id",     limit: 4
  end

  create_table "member_researchers", force: :cascade do |t|
    t.integer  "project_id",    limit: 4
    t.integer  "researcher_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "member_students", force: :cascade do |t|
    t.integer  "project_id",                       limit: 4
    t.integer  "student_id",                       limit: 4
    t.string   "tipo_vinculo",                     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.date     "data_inicio"
    t.date     "data_fim"
    t.boolean  "relatorio_entregue"
    t.boolean  "notificacao_antecipada"
    t.boolean  "notificacao_no_dia"
    t.boolean  "notificacao_atrasada"
    t.date     "ultima_data_notificacao_atrasada"
  end

  create_table "project_attachments", force: :cascade do |t|
    t.integer  "project_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "project_publications", force: :cascade do |t|
    t.integer  "project_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "nome",                limit: 255
    t.integer  "researcher_id",       limit: 4
    t.date     "data_inicio"
    t.date     "data_fim"
    t.string   "numero_suap",         limit: 255
    t.string   "nome_edital",         limit: 255
    t.boolean  "auxilio_aipct"
    t.integer  "valor_aipct_cents",   limit: 4
    t.integer  "research_line_id",    limit: 4
    t.integer  "situation_id",        limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "scholarship_type_id", limit: 4
    t.string   "edital_file_name",    limit: 255
    t.string   "edital_content_type", limit: 255
    t.integer  "edital_file_size",    limit: 4
    t.datetime "edital_updated_at"
    t.text     "observacao",          limit: 65535
  end

  create_table "report_attachments", force: :cascade do |t|
    t.integer  "report_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.text     "atividades_desenvolvidas",         limit: 65535
    t.text     "resultados_obtidos",               limit: 65535
    t.text     "dificuldades_encontradas",         limit: 65535
    t.text     "proximas_etapas",                  limit: 65535
    t.text     "conclusoes",                       limit: 65535
    t.text     "referencias",                      limit: 65535
    t.boolean  "notificacao_antecipada"
    t.boolean  "notificacao_no_dia"
    t.boolean  "notificacao_atrasada"
    t.integer  "project_id",                       limit: 4
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.boolean  "entregue"
    t.string   "access_token",                     limit: 255
    t.date     "periodo_desenvolvimento_inicio"
    t.date     "periodo_desenvolvimento_fim"
    t.string   "avaliacao",                        limit: 255
    t.date     "ultima_data_notificacao_atrasada"
    t.text     "observacao_reformular",            limit: 65535
    t.integer  "status",                           limit: 4,     default: 0
    t.datetime "enviado_pelo_pesquisador_em"
  end

  create_table "research_groups", force: :cascade do |t|
    t.string   "nome",               limit: 255
    t.integer  "researcher_id",      limit: 4
    t.date     "ultima_verificacao"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "link_grupo_cnpq",    limit: 255
    t.integer  "area_id",            limit: 4
  end

  create_table "research_lines", force: :cascade do |t|
    t.string   "nome",              limit: 255
    t.integer  "research_group_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "researchers", force: :cascade do |t|
    t.string   "nome",        limit: 255
    t.string   "cpf",         limit: 255
    t.string   "rg",          limit: 255
    t.string   "email",       limit: 255
    t.string   "telefone",    limit: 255
    t.string   "celular",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "link_lattes", limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "scholarship_types", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "situations", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "cpf",        limit: 255
    t.string   "rg",         limit: 255
    t.string   "email",      limit: 255
    t.string   "telefone",   limit: 255
    t.string   "celular",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_authorization",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
