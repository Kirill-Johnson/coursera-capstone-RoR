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

ActiveRecord::Schema.define(version: 20170130051702) do

  create_table "foos", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "caption"
    t.integer  "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["creator_id"], name: "index_images_on_creator_id"

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "role_name",  null: false
    t.string   "mname"
    t.integer  "mid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["mid"], name: "index_roles_on_mid"
  add_index "roles", ["mname", "mid"], name: "index_roles_on_mname_and_mid"
  add_index "roles", ["mname"], name: "index_roles_on_mname"
  add_index "roles", ["user_id"], name: "index_roles_on_user_id"

  create_table "thing_images", force: :cascade do |t|
    t.integer  "image_id",               null: false
    t.integer  "thing_id",               null: false
    t.integer  "priority",   default: 5, null: false
    t.integer  "creator_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "thing_images", ["image_id", "thing_id"], name: "index_thing_images_on_image_id_and_thing_id", unique: true
  add_index "thing_images", ["image_id"], name: "index_thing_images_on_image_id"
  add_index "thing_images", ["thing_id"], name: "index_thing_images_on_thing_id"

  create_table "things", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "things", ["name"], name: "index_things_on_name"

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
