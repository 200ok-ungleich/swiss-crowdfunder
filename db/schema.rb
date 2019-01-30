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

ActiveRecord::Schema.define(version: 2018_09_30_104151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "campaign_translations", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.text "description_html"
    t.text "claim"
    t.text "order_description"
    t.text "order_description_html"
    t.text "order_success"
    t.text "order_success_html"
    t.string "youtube_url"
    t.index ["campaign_id"], name: "index_campaign_translations_on_campaign_id"
    t.index ["locale"], name: "index_campaign_translations_on_locale"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "goal"
    t.date "start_date"
    t.date "end_date"
    t.string "title"
    t.string "youtube_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "description_html"
    t.text "claim"
    t.string "facebook_url"
    t.string "twitter_url"
    t.text "order_description"
    t.text "order_description_html"
    t.string "slug"
    t.string "email"
    t.text "order_success"
    t.text "order_success_html"
    t.string "image"
    t.boolean "active", default: false
    t.index ["slug"], name: "index_campaigns_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "goodies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.integer "quantity"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_goodies_on_campaign_id"
  end

  create_table "goody_translations", force: :cascade do |t|
    t.integer "goody_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["goody_id"], name: "index_goody_translations_on_goody_id"
    t.index ["locale"], name: "index_goody_translations_on_locale"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "amount"
    t.string "payment_type"
    t.boolean "paid"
    t.bigint "goody_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "agreement"
    t.index ["goody_id"], name: "index_orders_on_goody_id"
  end

  create_table "supporters", force: :cascade do |t|
    t.bigint "order_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.index ["order_id"], name: "index_supporters_on_order_id"
  end

  add_foreign_key "goodies", "campaigns"
  add_foreign_key "orders", "goodies"
  add_foreign_key "supporters", "orders"
end
