# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create_table "products", force: :cascade do |t|
#     t.string   "name"
#     t.text     "description"
#     t.integer  "price_in_cent"
#     t.datetime "created_at",    null: false
#     t.datetime "updated_at",    null: false
#   end

Product.create!(
  :name => "Pizza",
  :description => "Yummy stuff to eat",
  :price_in_cents => "99"
)

User.destroy_all
Product.destroy_all

User.create!({
  email: "example@bitmakerlabs.com",
  name: "Example User",
  password: "pass",
  password_confirmation: "pass"
  }
)

100.times do |i|

Product.create({
  name: "Product#{i}",
  description: "Description#{i}",
  price_in_cents: i
  }
)
end

