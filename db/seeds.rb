# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   password123#

COUNT = 10

puts "Populating Database"

admin = User.new(email: "admin@gmail.com", password: "123123", password_confirmation: "123123", user_type: "admin")
admin.avatar.attach(io: File.open('app/assets/images/picture.png'), filename: 'pic.png')
admin.save

users = []
COUNT.times.each do |i|
  user = User.new(email: "buyer_#{i + 1}@gmail.com", password: "123123", password_confirmation: "123123", user_type: "buyer")
  user.avatar.attach(io: File.open('app/assets/images/picture.png'), filename: 'pic.png')
  user.save

  users << user
end

features = []
COUNT.times.each do |i|
  feature = Feature.create(name: "Feature #{i + 1}", code: "Code #{i + 1}", unit_price: (1..100).to_a.sample, max_unit_limit: (1..100).to_a.sample)

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

subscriptions = []
users.each do |user|
  COUNT.times.each do
    plan = plans.sample
    next if user.reload.plan_ids.include?(plan.id)

    subscription = user.subscriptions.create(plan_id: plan.id, name: plan.name)
    subscriptions << subscription
  end
end

subscriptions.each do |subscription|
  subscription.plan.features.each do |feature|
    subscription.subscription_features.create(feature_id: feature.id, consumed_units: (0..feature.max_unit_limit).to_a.sample)
  end
end

users.each do |user|
  Payment.generate_bills(user.id)
end

puts "Seeding done."
