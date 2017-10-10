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

ActiveRecord::Schema.define(version: 20171008203759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "origin_type"
    t.boolean "situation"
    t.bigint "origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.index ["origin_type", "origin_id"], name: "index_attachments_on_origin_type_and_origin_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "teaser"
    t.text "body", null: false
    t.boolean "draft", default: false
    t.datetime "published_at"
    t.integer "user_id", null: false
    t.string "custom_url"
    t.integer "access_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string "creator_type"
    t.integer "creator_id"
    t.string "editor_type"
    t.integer "editor_id"
    t.integer "thread_id", null: false
    t.text "body", null: false
    t.datetime "deleted_at"
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
    t.index ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
    t.index ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
    t.index ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"
  end

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string "subscriber_type", null: false
    t.integer "subscriber_id", null: false
    t.integer "thread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
    t.index ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"
  end

  create_table "commontator_threads", force: :cascade do |t|
    t.string "commontable_type"
    t.integer "commontable_id"
    t.datetime "closed_at"
    t.string "closer_type"
    t.integer "closer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.text "local"
    t.integer "participants_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_at"
    t.boolean "status"
  end

  create_table "financial_transactions", force: :cascade do |t|
    t.string "object"
    t.string "origin"
    t.string "transaction_type", limit: 1
    t.decimal "value", precision: 13, scale: 2
    t.bigint "user_id"
    t.datetime "payment_date"
    t.string "payment_method"
    t.boolean "consolidated", default: false, null: false
    t.datetime "consolidation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_financial_transactions_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["event_id"], name: "index_gifts_on_event_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "album_id"
    t.string "asset"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_images_on_album_id"
  end

  create_table "link_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.bigint "link_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["link_category_id"], name: "index_links_on_link_category_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "permalink"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permalink"], name: "index_pages_on_permalink"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "order"
    t.boolean "site"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category"
    t.string "logo"
    t.index ["event_id"], name: "index_partners_on_event_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "presence", default: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "social_networks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_networks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "cpf"
    t.string "nickname"
    t.string "provider"
    t.string "uid"
    t.string "avatar"
    t.string "cover_photo"
    t.text "bio"
    t.string "job_title"
    t.string "company"
    t.string "gender"
    t.string "phone"
    t.string "celphone"
    t.string "schooling"
    t.date "birth_date"
    t.string "marital_status"
    t.string "father"
    t.string "mother"
    t.string "rg"
    t.string "consignor_organ"
    t.string "place_of_birth"
    t.string "special_needs"
    t.string "occupation"
    t.string "address"
    t.string "uf"
    t.string "neighborhood"
    t.string "zip_code"
    t.string "complement"
    t.boolean "need_certificate"
    t.boolean "digital_certificate"
    t.boolean "printed_certificate"
    t.boolean "receber_email", default: true
    t.boolean "receber_email_parceiros", default: true
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  create_table "winners", force: :cascade do |t|
    t.bigint "gift_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_winners_on_gift_id"
    t.index ["user_id"], name: "index_winners_on_user_id"
  end

  add_foreign_key "financial_transactions", "users"
  add_foreign_key "gifts", "events"
  add_foreign_key "images", "albums"
  add_foreign_key "links", "link_categories"
  add_foreign_key "partners", "events"
  add_foreign_key "social_networks", "users"
  add_foreign_key "winners", "gifts"
  add_foreign_key "winners", "users"
end
