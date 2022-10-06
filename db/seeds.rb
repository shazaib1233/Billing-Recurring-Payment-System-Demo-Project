# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COUNT = 3

puts "Populating Database"

admin = User.new(email: "admin@example.com", password: "password123#", password_confirmation: "password123#", user_type: "admin")
admin.avatar.attach(io: File.open('app/assets/images/picture.png'), filename: 'pic.png')
admin.save

users = []
COUNT.times.each do |i|
  user = User.new(email: "buyer_#{i + 1}@gmail.com", password: "password123#", password_confirmation: "password123#", user_type: "buyer")
  user.avatar.attach(io: File.open('app/assets/images/picture.png'), filename: 'pic.png')
  user.save

  users << user
end

features = []
COUNT.times.each do |i|
  feature = Feature.create(name: "Feature #{(i + 1) * 2}", code: "Code #{i + 1}", unit_price: (1..100).to_a.sample, max_unit_limit: (1..100).to_a.sample)
  features << feature
end

plans = []
COUNT.times.each do |i|
  plan = Plan.create(name: "Plan #{i + 1}", monthly_fee: i + 100, user_id: admin.id)

  (1..features.count).to_a.sample.times.each do |j|
    plan.feature_plans.create(feature_id: features[j].id, allocated_units: [(1..100).to_a.sample, features[j].max_unit_limit].min)
  end

  plans << plan
end

users.each do |user|
  plans.each do |plan|
    user.subscriptions.create(consumed_units: (1..3).to_a.sample, plan_id: plan.id, feature_id: plan.features.first.id)
  end
end

puts "Seeding done."
