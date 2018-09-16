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

ActiveRecord::Schema.define(version: 2018_09_16_160054) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "snake_charms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "rescue_date_time", null: false
    t.string "address", null: false
    t.string "village", null: false
    t.string "pincode", null: false
    t.string "country", null: false
    t.string "caller_name", null: false
    t.string "caller_phone", null: false
    t.float "snake_length", null: false
    t.string "snake_length_unit", null: false
    t.float "snake_weight", null: false
    t.string "snake_weight_unit", null: false
    t.string "snake_sex", null: false
    t.string "snake_color", null: false
    t.string "snake_behavior", null: false
    t.string "snake_macro_habitat", null: false
    t.string "snake_micro_habitat", null: false
    t.string "snake_condition", null: false
    t.datetime "release_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "snake_caudals"
    t.index ["user_id"], name: "index_snake_charms_on_user_id"
  end

  create_table "snake_photo_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "head_lateral_left", default: false
    t.boolean "head_lateral_right", default: false
    t.boolean "rostral", default: false
    t.boolean "head_dorsal", default: false
    t.boolean "hood_dorsal", default: false
    t.boolean "full_body", default: false
    t.boolean "subcaudals", default: false
    t.bigint "active_storage_attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_storage_attachment_id"], name: "index_snake_photo_tags_on_active_storage_attachment_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email_id", null: false
    t.string "phone", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "about_user"
    t.string "purpose"
  end

end
