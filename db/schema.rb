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

ActiveRecord::Schema.define(version: 2020_09_15_153234) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "colors", force: :cascade do |t|
    t.string "title"
    t.string "code"
    t.string "rgb"
  end

  create_table "complectation_colors", force: :cascade do |t|
    t.integer "color_id"
    t.integer "complectation_id"
    t.boolean "stock"
    t.integer "modification_id"
    t.string "code"
    t.index ["color_id"], name: "index_complectation_colors_on_color_id"
    t.index ["complectation_id"], name: "index_complectation_colors_on_complectation_id"
    t.index ["modification_id"], name: "index_complectation_colors_on_modification_id"
  end

  create_table "complectation_options", force: :cascade do |t|
    t.integer "complectation_id"
    t.integer "option_id"
    t.index ["complectation_id"], name: "index_complectation_options_on_complectation_id"
    t.index ["option_id"], name: "index_complectation_options_on_option_id"
  end

  create_table "complectations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "engine"
    t.integer "clapan"
    t.integer "power"
    t.string "transmission"
    t.string "order"
    t.string "colors"
    t.integer "owners"
    t.integer "millage"
    t.string "casecar"
    t.string "drive"
    t.integer "year"
    t.string "condition"
    t.string "price_new"
    t.string "price_old"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "complectation_id"
    t.integer "model_id"
    t.string "casecar_url"
    t.integer "modification_id"
    t.index ["model_id"], name: "index_complectations_on_model_id"
    t.index ["modification_id"], name: "index_complectations_on_modification_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engines", force: :cascade do |t|
    t.string "name"
    t.string "base_id"
    t.integer "modification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modification_id"], name: "index_engines_on_modification_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "description"
    t.text "slave"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "model"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "links"
    t.string "gallery_file_name"
    t.string "gallery_content_type"
    t.integer "gallery_file_size"
    t.datetime "gallery_updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "price"
    t.integer "product_id"
    t.integer "complectation_id"
    t.index ["complectation_id"], name: "index_models_on_complectation_id"
  end

  create_table "modification_colors", force: :cascade do |t|
    t.integer "color_id"
    t.integer "modification_id"
    t.index ["color_id"], name: "index_modification_colors_on_color_id"
    t.index ["modification_id"], name: "index_modification_colors_on_modification_id"
  end

  create_table "modification_complectations", force: :cascade do |t|
    t.integer "modification_id"
    t.integer "complectation_id"
    t.index ["complectation_id"], name: "index_modification_complectations_on_complectation_id"
    t.index ["modification_id"], name: "index_modification_complectations_on_modification_id"
  end

  create_table "modification_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "modification_id"
    t.integer "color_id"
    t.string "base_id"
    t.index ["color_id"], name: "index_modification_images_on_color_id"
    t.index ["modification_id"], name: "index_modification_images_on_modification_id"
  end

  create_table "modifications", force: :cascade do |t|
    t.string "name"
    t.string "second_name"
    t.string "anchor_name"
    t.string "link_about"
    t.string "link_complectations"
    t.text "description"
    t.boolean "show"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "model_id"
    t.string "base_id"
    t.integer "price_sort"
    t.index ["model_id"], name: "index_modifications_on_model_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "property"
    t.text "name"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.integer "complectation_id"
    t.index ["complectation_id"], name: "index_options_on_complectation_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "meta"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gallery_file_name"
    t.string "gallery_content_type"
    t.integer "gallery_file_size"
    t.datetime "gallery_updated_at"
    t.string "bonus"
    t.date "finish"
    t.string "price"
    t.integer "model_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gallery_file_name"
    t.string "gallery_content_type"
    t.integer "gallery_file_size"
    t.datetime "gallery_updated_at"
  end

  create_table "service_jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "service_reviews", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "service_sales", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "preview_file_name"
    t.string "preview_content_type"
    t.integer "preview_file_size"
    t.datetime "preview_updated_at"
  end

  create_table "service_sliders", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "service_whatwedos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_works", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_job_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["service_job_id"], name: "index_service_works_on_service_job_id"
  end

  create_table "service_writes", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "model"
    t.string "year"
    t.string "work"
    t.string "mileage"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "slave"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gallery_file_name"
    t.string "gallery_content_type"
    t.integer "gallery_file_size"
    t.datetime "gallery_updated_at"
    t.string "word1"
    t.string "word2"
  end

  create_table "specifications", force: :cascade do |t|
    t.string "base_id"
    t.string "name"
    t.integer "modification_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "engine_id"
    t.index ["engine_id"], name: "index_specifications_on_engine_id"
    t.index ["modification_id"], name: "index_specifications_on_modification_id"
  end

  create_table "tradein_cars", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "engine"
    t.integer "clapan"
    t.integer "power"
    t.string "transmission"
    t.string "type"
    t.string "color"
    t.integer "owners"
    t.integer "millage"
    t.string "case"
    t.string "drive"
    t.integer "year"
    t.string "condition"
    t.string "price_new"
    t.string "price_old"
    t.string "link"
    t.string "url"
    t.integer "sort"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
