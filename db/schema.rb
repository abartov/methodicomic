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

ActiveRecord::Schema.define(version: 20140313205522) do

  create_table "gcd_brand", force: true do |t|
    t.string   "name",                                                    null: false
    t.integer  "parent_id"
    t.integer  "year_began"
    t.integer  "year_ended"
    t.text     "notes",                limit: 2147483647,                 null: false
    t.string   "url",                                                     null: false
    t.integer  "issue_count",                             default: 0,     null: false
    t.datetime "created",                                                 null: false
    t.datetime "modified",                                                null: false
    t.boolean  "reserved",                                default: false, null: false
    t.boolean  "deleted",                                 default: false, null: false
    t.boolean  "year_began_uncertain",                    default: false, null: false
    t.boolean  "year_ended_uncertain",                    default: false, null: false
  end

  add_index "gcd_brand", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_brand", ["name"], name: "name", using: :btree
  add_index "gcd_brand", ["parent_id"], name: "parent_id", using: :btree
  add_index "gcd_brand", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_brand", ["year_began"], name: "year_began", using: :btree
  add_index "gcd_brand", ["year_began_uncertain"], name: "year_began_uncertain", using: :btree
  add_index "gcd_brand", ["year_ended_uncertain"], name: "year_ended_uncertain", using: :btree

  create_table "gcd_brand_emblem_group", force: true do |t|
    t.integer "brand_id",      null: false
    t.integer "brandgroup_id", null: false
  end

  add_index "gcd_brand_emblem_group", ["brand_id", "brandgroup_id"], name: "gcd_brand_emblem_group_brand_id_4dd3b49d7f79dbe3_uniq", unique: true, using: :btree
  add_index "gcd_brand_emblem_group", ["brand_id"], name: "gcd_brand_emblem_group_74876276", using: :btree
  add_index "gcd_brand_emblem_group", ["brandgroup_id"], name: "gcd_brand_emblem_group_9eac909a", using: :btree

  create_table "gcd_brand_group", force: true do |t|
    t.string   "name",                                    null: false
    t.integer  "year_began"
    t.integer  "year_ended"
    t.boolean  "year_began_uncertain",                    null: false
    t.boolean  "year_ended_uncertain",                    null: false
    t.text     "notes",                limit: 2147483647, null: false
    t.string   "url",                                     null: false
    t.boolean  "reserved",                                null: false
    t.datetime "created",                                 null: false
    t.datetime "modified",                                null: false
    t.boolean  "deleted",                                 null: false
    t.integer  "parent_id",                               null: false
    t.integer  "issue_count",                             null: false
  end

  add_index "gcd_brand_group", ["deleted"], name: "gcd_brand_group_6cc99b0b", using: :btree
  add_index "gcd_brand_group", ["name"], name: "gcd_brand_group_52094d6e", using: :btree
  add_index "gcd_brand_group", ["parent_id"], name: "gcd_brand_group_63f17a16", using: :btree
  add_index "gcd_brand_group", ["reserved"], name: "gcd_brand_group_3b2a5c11", using: :btree
  add_index "gcd_brand_group", ["year_began"], name: "gcd_brand_group_d4f3f470", using: :btree
  add_index "gcd_brand_group", ["year_began_uncertain"], name: "gcd_brand_group_b5b058a2", using: :btree
  add_index "gcd_brand_group", ["year_ended_uncertain"], name: "gcd_brand_group_8c53af9d", using: :btree

  create_table "gcd_brand_use", force: true do |t|
    t.integer "publisher_id",                            null: false
    t.integer "emblem_id",                               null: false
    t.integer "year_began"
    t.integer "year_ended"
    t.boolean "year_began_uncertain",                    null: false
    t.boolean "year_ended_uncertain",                    null: false
    t.text    "notes",                limit: 2147483647, null: false
    t.boolean "reserved",                                null: false
    t.date    "created",                                 null: false
    t.date    "modified",                                null: false
  end

  add_index "gcd_brand_use", ["emblem_id"], name: "gcd_brand_use_7c3d3954", using: :btree
  add_index "gcd_brand_use", ["publisher_id"], name: "gcd_brand_use_22dd9c39", using: :btree
  add_index "gcd_brand_use", ["reserved"], name: "gcd_brand_use_3b2a5c11", using: :btree
  add_index "gcd_brand_use", ["year_began"], name: "gcd_brand_use_d4f3f470", using: :btree
  add_index "gcd_brand_use", ["year_began_uncertain"], name: "gcd_brand_use_b5b058a2", using: :btree
  add_index "gcd_brand_use", ["year_ended_uncertain"], name: "gcd_brand_use_8c53af9d", using: :btree

  create_table "gcd_country", force: true do |t|
    t.string "code", limit: 10, null: false
    t.string "name",            null: false
  end

  add_index "gcd_country", ["code"], name: "code_2", unique: true, using: :btree
  add_index "gcd_country", ["name"], name: "country", length: {"name"=>50}, using: :btree

  create_table "gcd_indicia_publisher", force: true do |t|
    t.string   "name",                                                    null: false
    t.integer  "parent_id",                                               null: false
    t.integer  "country_id",                                              null: false
    t.integer  "year_began"
    t.integer  "year_ended"
    t.boolean  "is_surrogate",                            default: false, null: false
    t.text     "notes",                limit: 2147483647,                 null: false
    t.string   "url",                                                     null: false
    t.integer  "issue_count",                             default: 0,     null: false
    t.datetime "created",                                                 null: false
    t.datetime "modified",                                                null: false
    t.boolean  "reserved",                                default: false, null: false
    t.boolean  "deleted",                                 default: false, null: false
    t.boolean  "year_began_uncertain",                    default: false, null: false
    t.boolean  "year_ended_uncertain",                    default: false, null: false
  end

  add_index "gcd_indicia_publisher", ["country_id"], name: "country_id", using: :btree
  add_index "gcd_indicia_publisher", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_indicia_publisher", ["is_surrogate"], name: "is_surrogate", using: :btree
  add_index "gcd_indicia_publisher", ["name"], name: "name", using: :btree
  add_index "gcd_indicia_publisher", ["parent_id"], name: "parent_id", using: :btree
  add_index "gcd_indicia_publisher", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_indicia_publisher", ["year_began"], name: "year_began", using: :btree
  add_index "gcd_indicia_publisher", ["year_began_uncertain"], name: "year_began_uncertain", using: :btree
  add_index "gcd_indicia_publisher", ["year_ended_uncertain"], name: "year_ended_uncertain", using: :btree

  create_table "gcd_issue", force: true do |t|
    t.string   "number",                     limit: 50,                                                                  null: false
    t.string   "volume",                     limit: 50,                                  default: "",                    null: false
    t.boolean  "no_volume",                                                              default: false,                 null: false
    t.boolean  "display_volume_with_number",                                             default: false,                 null: false
    t.integer  "series_id",                                                                                              null: false
    t.integer  "indicia_publisher_id"
    t.boolean  "indicia_pub_not_printed",                                                                                null: false
    t.integer  "brand_id"
    t.boolean  "no_brand",                                                                                               null: false
    t.string   "publication_date",                                                                                       null: false
    t.string   "key_date",                   limit: 10,                                                                  null: false
    t.integer  "sort_code",                                                                                              null: false
    t.string   "price",                                                                                                  null: false
    t.decimal  "page_count",                                    precision: 10, scale: 3
    t.boolean  "page_count_uncertain",                                                   default: false,                 null: false
    t.string   "indicia_frequency",                                                      default: "",                    null: false
    t.boolean  "no_indicia_frequency",                                                   default: false,                 null: false
    t.text     "editing",                    limit: 2147483647,                                                          null: false
    t.boolean  "no_editing",                                                             default: false,                 null: false
    t.text     "notes",                      limit: 2147483647,                                                          null: false
    t.datetime "created",                                                                default: '1901-01-01 00:00:00', null: false
    t.datetime "modified",                                                               default: '1901-01-01 00:00:00', null: false
    t.boolean  "reserved",                                                               default: false,                 null: false
    t.boolean  "deleted",                                                                default: false,                 null: false
    t.boolean  "is_indexed",                                                             default: false,                 null: false
    t.string   "isbn",                       limit: 32,                                  default: "",                    null: false
    t.string   "valid_isbn",                 limit: 13,                                  default: "",                    null: false
    t.boolean  "no_isbn",                                                                default: false,                 null: false
    t.integer  "variant_of_id"
    t.string   "variant_name",                                                           default: "",                    null: false
    t.string   "barcode",                    limit: 38,                                  default: "",                    null: false
    t.boolean  "no_barcode",                                                             default: false,                 null: false
    t.string   "title",                                                                  default: "",                    null: false
    t.boolean  "no_title",                                                               default: false,                 null: false
    t.string   "on_sale_date",               limit: 10,                                                                  null: false
    t.boolean  "on_sale_date_uncertain",                                                 default: false,                 null: false
    t.string   "rating",                                                                                                 null: false
    t.boolean  "no_rating",                                                                                              null: false
  end

  add_index "gcd_issue", ["barcode"], name: "barcode", using: :btree
  add_index "gcd_issue", ["brand_id"], name: "brand_id", using: :btree
  add_index "gcd_issue", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_issue", ["display_volume_with_number"], name: "display_volume_with_number", using: :btree
  add_index "gcd_issue", ["indicia_publisher_id"], name: "indicia_publisher_id", using: :btree
  add_index "gcd_issue", ["is_indexed"], name: "is_indexed", using: :btree
  add_index "gcd_issue", ["isbn"], name: "isbn", using: :btree
  add_index "gcd_issue", ["key_date"], name: "Key_Date", using: :btree
  add_index "gcd_issue", ["modified"], name: "Modified", using: :btree
  add_index "gcd_issue", ["no_brand"], name: "no_brand", using: :btree
  add_index "gcd_issue", ["no_editing"], name: "no_editing", using: :btree
  add_index "gcd_issue", ["no_indicia_frequency"], name: "no_indicia_frequency", using: :btree
  add_index "gcd_issue", ["no_isbn"], name: "no_isbn", using: :btree
  add_index "gcd_issue", ["no_rating"], name: "gcd_issue_ed4c6b73", using: :btree
  add_index "gcd_issue", ["no_title"], name: "no_title", using: :btree
  add_index "gcd_issue", ["no_volume"], name: "no_volume", using: :btree
  add_index "gcd_issue", ["number"], name: "Issue", using: :btree
  add_index "gcd_issue", ["on_sale_date"], name: "on_sale_date", using: :btree
  add_index "gcd_issue", ["rating"], name: "gcd_issue_1a619ca6", using: :btree
  add_index "gcd_issue", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_issue", ["series_id", "sort_code"], name: "series_id_sort_code", unique: true, using: :btree
  add_index "gcd_issue", ["series_id"], name: "SeriesID", using: :btree
  add_index "gcd_issue", ["sort_code"], name: "sort_code", using: :btree
  add_index "gcd_issue", ["title"], name: "title", using: :btree
  add_index "gcd_issue", ["valid_isbn"], name: "valid_isbn", using: :btree
  add_index "gcd_issue", ["variant_of_id"], name: "variant_of_id", using: :btree
  add_index "gcd_issue", ["volume"], name: "VolumeNum", using: :btree

  create_table "gcd_issue_reprint", force: true do |t|
    t.integer "origin_issue_id",                                    null: false
    t.integer "target_issue_id",                                    null: false
    t.text    "notes",           limit: 2147483647,                 null: false
    t.boolean "reserved",                           default: false, null: false
  end

  add_index "gcd_issue_reprint", ["origin_issue_id"], name: "issue_from", using: :btree
  add_index "gcd_issue_reprint", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_issue_reprint", ["target_issue_id"], name: "issue_to", using: :btree

  create_table "gcd_language", force: true do |t|
    t.string "code", limit: 10, null: false
    t.string "name",            null: false
  end

  add_index "gcd_language", ["code"], name: "code_2", unique: true, using: :btree
  add_index "gcd_language", ["name"], name: "language", length: {"name"=>10}, using: :btree

  create_table "gcd_publisher", force: true do |t|
    t.string   "name",                                                                       null: false
    t.integer  "country_id",                                                                 null: false
    t.integer  "year_began"
    t.integer  "year_ended"
    t.text     "notes",                   limit: 2147483647,                                 null: false
    t.string   "url",                                                                        null: false
    t.boolean  "is_master",                                                                  null: false
    t.integer  "parent_id"
    t.integer  "imprint_count",                              default: 0,                     null: false
    t.integer  "brand_count",                                default: 0,                     null: false
    t.integer  "indicia_publisher_count",                    default: 0,                     null: false
    t.integer  "series_count",                               default: 0,                     null: false
    t.datetime "created",                                    default: '1901-01-01 00:00:00', null: false
    t.datetime "modified",                                   default: '1901-01-01 00:00:00', null: false
    t.integer  "issue_count",                                default: 0,                     null: false
    t.boolean  "reserved",                                   default: false,                 null: false
    t.boolean  "deleted",                                    default: false,                 null: false
    t.boolean  "year_began_uncertain",                       default: false,                 null: false
    t.boolean  "year_ended_uncertain",                       default: false,                 null: false
  end

  add_index "gcd_publisher", ["brand_count"], name: "brand_count", using: :btree
  add_index "gcd_publisher", ["country_id"], name: "country_id", using: :btree
  add_index "gcd_publisher", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_publisher", ["indicia_publisher_count"], name: "indicia_publisher_count", using: :btree
  add_index "gcd_publisher", ["is_master"], name: "Master", using: :btree
  add_index "gcd_publisher", ["name"], name: "PubName", using: :btree
  add_index "gcd_publisher", ["parent_id"], name: "ParentID", using: :btree
  add_index "gcd_publisher", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_publisher", ["year_began"], name: "YearBegan", using: :btree
  add_index "gcd_publisher", ["year_began_uncertain"], name: "year_began_uncertain", using: :btree
  add_index "gcd_publisher", ["year_ended_uncertain"], name: "year_ended_uncertain", using: :btree

  create_table "gcd_reprint", force: true do |t|
    t.integer "origin_id",                                    null: false
    t.integer "target_id",                                    null: false
    t.text    "notes",     limit: 2147483647,                 null: false
    t.boolean "reserved",                     default: false, null: false
  end

  add_index "gcd_reprint", ["origin_id"], name: "reprint_from", using: :btree
  add_index "gcd_reprint", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_reprint", ["target_id"], name: "reprint_to", using: :btree

  create_table "gcd_reprint_from_issue", force: true do |t|
    t.integer "origin_issue_id",                                    null: false
    t.integer "target_id",                                          null: false
    t.text    "notes",           limit: 2147483647,                 null: false
    t.boolean "reserved",                           default: false, null: false
  end

  add_index "gcd_reprint_from_issue", ["origin_issue_id"], name: "reprint_to_issue_from", using: :btree
  add_index "gcd_reprint_from_issue", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_reprint_from_issue", ["target_id"], name: "reprint_to_issue_to", using: :btree

  create_table "gcd_reprint_to_issue", force: true do |t|
    t.integer "origin_id",                                          null: false
    t.integer "target_issue_id",                                    null: false
    t.text    "notes",           limit: 2147483647,                 null: false
    t.boolean "reserved",                           default: false, null: false
  end

  add_index "gcd_reprint_to_issue", ["origin_id"], name: "reprint_to_issue_from", using: :btree
  add_index "gcd_reprint_to_issue", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_reprint_to_issue", ["target_issue_id"], name: "reprint_to_issue_to", using: :btree

  create_table "gcd_series", force: true do |t|
    t.string   "name",                                                                     null: false
    t.string   "sort_name",                                                                null: false
    t.string   "format",                                   default: "",                    null: false
    t.integer  "year_began",                                                               null: false
    t.boolean  "year_began_uncertain",                     default: false,                 null: false
    t.integer  "year_ended"
    t.boolean  "year_ended_uncertain",                     default: false,                 null: false
    t.string   "publication_dates",                        default: "",                    null: false
    t.integer  "first_issue_id"
    t.integer  "last_issue_id"
    t.boolean  "is_current",                               default: false,                 null: false
    t.integer  "publisher_id",                                                             null: false
    t.integer  "country_id",                                                               null: false
    t.integer  "language_id",                                                              null: false
    t.text     "tracking_notes",        limit: 2147483647,                                 null: false
    t.text     "notes",                 limit: 2147483647,                                 null: false
    t.text     "publication_notes",     limit: 2147483647,                                 null: false
    t.boolean  "has_gallery",                              default: false,                 null: false
    t.integer  "open_reserve"
    t.integer  "issue_count",                              default: 0,                     null: false
    t.datetime "created",                                  default: '1901-01-01 00:00:00', null: false
    t.datetime "modified",                                 default: '1901-01-01 00:00:00', null: false
    t.boolean  "reserved",                                 default: false,                 null: false
    t.boolean  "deleted",                                  default: false,                 null: false
    t.boolean  "has_indicia_frequency",                    default: true,                  null: false
    t.boolean  "has_isbn",                                 default: true,                  null: false
    t.boolean  "has_barcode",                              default: true,                  null: false
    t.boolean  "has_issue_title",                          default: false,                 null: false
    t.boolean  "has_volume",                               default: true,                  null: false
    t.boolean  "is_comics_publication",                    default: true,                  null: false
    t.string   "color",                                                                    null: false
    t.string   "dimensions",                                                               null: false
    t.string   "paper_stock",                                                              null: false
    t.string   "binding",                                                                  null: false
    t.string   "publishing_format",                                                        null: false
    t.boolean  "has_rating",                                                               null: false
  end

  add_index "gcd_series", ["country_id"], name: "country_id", using: :btree
  add_index "gcd_series", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_series", ["first_issue_id"], name: "first_issue_id", using: :btree
  add_index "gcd_series", ["has_gallery"], name: "HasGallery", using: :btree
  add_index "gcd_series", ["is_current"], name: "is_current", using: :btree
  add_index "gcd_series", ["language_id"], name: "language_id", using: :btree
  add_index "gcd_series", ["last_issue_id"], name: "last_issue_id", using: :btree
  add_index "gcd_series", ["name"], name: "Bk_Name", length: {"name"=>150}, using: :btree
  add_index "gcd_series", ["publisher_id"], name: "PubID", using: :btree
  add_index "gcd_series", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_series", ["sort_name"], name: "sort_name", using: :btree
  add_index "gcd_series", ["year_began"], name: "Yr_Began", using: :btree

  create_table "gcd_series_users", id: false, force: true do |t|
    t.integer "user_id",       null: false
    t.integer "gcd_series_id", null: false
  end

  create_table "gcd_story", force: true do |t|
    t.string   "title",                                                            default: "",                    null: false
    t.boolean  "title_inferred",                                                   default: false,                 null: false
    t.string   "feature",                                                                                          null: false
    t.integer  "sequence_number",                                                                                  null: false
    t.decimal  "page_count",                              precision: 10, scale: 3
    t.integer  "issue_id",                                                                                         null: false
    t.text     "script",               limit: 2147483647,                                                          null: false
    t.text     "pencils",              limit: 2147483647,                                                          null: false
    t.text     "inks",                 limit: 2147483647,                                                          null: false
    t.text     "colors",               limit: 2147483647,                                                          null: false
    t.text     "letters",              limit: 2147483647,                                                          null: false
    t.text     "editing",              limit: 2147483647,                                                          null: false
    t.string   "genre",                                                            default: "",                    null: false
    t.text     "characters",           limit: 2147483647,                                                          null: false
    t.text     "synopsis",             limit: 2147483647,                                                          null: false
    t.text     "reprint_notes",        limit: 2147483647,                                                          null: false
    t.datetime "created",                                                          default: '1901-01-01 00:00:00', null: false
    t.datetime "modified",                                                         default: '1901-01-01 00:00:00', null: false
    t.text     "notes",                limit: 2147483647,                                                          null: false
    t.boolean  "no_script",                                                        default: false,                 null: false
    t.boolean  "no_pencils",                                                       default: false,                 null: false
    t.boolean  "no_inks",                                                          default: false,                 null: false
    t.boolean  "no_colors",                                                        default: false,                 null: false
    t.boolean  "no_letters",                                                       default: false,                 null: false
    t.boolean  "no_editing",                                                       default: false,                 null: false
    t.boolean  "page_count_uncertain",                                             default: false,                 null: false
    t.integer  "type_id",                                                                                          null: false
    t.string   "job_number",           limit: 25,                                  default: "",                    null: false
    t.boolean  "reserved",                                                         default: false,                 null: false
    t.boolean  "deleted",                                                          default: false,                 null: false
  end

  add_index "gcd_story", ["deleted"], name: "deleted", using: :btree
  add_index "gcd_story", ["issue_id"], name: "IssueID", using: :btree
  add_index "gcd_story", ["modified"], name: "Modified", using: :btree
  add_index "gcd_story", ["no_colors"], name: "no_colors", using: :btree
  add_index "gcd_story", ["no_editing"], name: "no_editing", using: :btree
  add_index "gcd_story", ["no_inks"], name: "no_inks", using: :btree
  add_index "gcd_story", ["no_letters"], name: "no_letters", using: :btree
  add_index "gcd_story", ["no_pencils"], name: "no_pencils", using: :btree
  add_index "gcd_story", ["no_script"], name: "no_script", using: :btree
  add_index "gcd_story", ["page_count"], name: "Pg_Cnt", using: :btree
  add_index "gcd_story", ["page_count_uncertain"], name: "page_count_uncertain", using: :btree
  add_index "gcd_story", ["reserved"], name: "reserved", using: :btree
  add_index "gcd_story", ["title_inferred"], name: "title_inferred", using: :btree
  add_index "gcd_story", ["type_id"], name: "type_id", using: :btree

  create_table "gcd_story_type", force: true do |t|
    t.string  "name",      limit: 50, null: false
    t.integer "sort_code",            null: false
  end

  add_index "gcd_story_type", ["name"], name: "name", unique: true, using: :btree
  add_index "gcd_story_type", ["sort_code"], name: "sort_code", unique: true, using: :btree

  create_table "user_series", force: true do |t|
    t.boolean  "finished"
    t.boolean  "priority"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_series", ["series_id"], name: "index_user_series_on_series_id", using: :btree
  add_index "user_series", ["user_id"], name: "index_user_series_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_language_code"
  end

end
