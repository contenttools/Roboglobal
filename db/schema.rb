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

ActiveRecord::Schema.define(version: 20150825123811) do

  create_table "attachments", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.text     "tags",           limit: 65535
    t.date     "published_date"
    t.integer  "views",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "slug",           limit: 255
  end

  add_index "blog_posts", ["slug"], name: "index_blog_posts_on_slug", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "embedded_attachments", force: :cascade do |t|
    t.text     "embed_code",      limit: 65535
    t.integer  "attachable_id",   limit: 4
    t.string   "attachable_type", limit: 32
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "embedded_attachments", ["attachable_type", "attachable_id"], name: "index_embedded_attachments_on_attachable_type_and_attachable_id", using: :btree

  create_table "file_correlations", force: :cascade do |t|
    t.integer  "pdf_attachment_id", limit: 4
    t.integer  "document_id",       limit: 4
    t.string   "document_type",     limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "file_correlations", ["document_type", "document_id"], name: "index_file_correlations_on_document_type_and_document_id", using: :btree

  create_table "image_correlations", force: :cascade do |t|
    t.integer  "attachment_id",  limit: 4
    t.integer  "imageable_id",   limit: 4
    t.string   "imageable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "image_correlations", ["imageable_type", "imageable_id"], name: "index_image_correlations_on_imageable_type_and_imageable_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 32
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "pdf_attachments", force: :cascade do |t|
    t.integer  "doc_id",                limit: 4
    t.string   "doc_type",              limit: 255
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "pdf_attachments", ["doc_type", "doc_id"], name: "index_pdf_attachments_on_doc_type_and_doc_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_correlations", force: :cascade do |t|
    t.integer  "embedded_attachment_id", limit: 4
    t.integer  "video_id",               limit: 4
    t.string   "video_type",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "video_correlations", ["video_type", "video_id"], name: "index_video_correlations_on_video_type_and_video_id", using: :btree

end
