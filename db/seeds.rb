# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding..."
  count = 2

  for i in 0..count
    user = User.new(email: "userA#{i+1}@gmail.com", password: "123123", password_confirmation: "123123", user_type: "admin")
    user.save(validate: false)
    user = User.new(email: "userB#{i+1}@gmail.com", password: "123123", password_confirmation: "123123", user_type: "buyer")
    user.save(validate: false)
    Plan.create(name: "Plan #{i+1}", monthly_fee: i+100, user_id: User.admin.first.id)
    Feature.create(name: "Feature #{(i+1)*2}", code: "Code #{i+1}", unit_price: i+3, max_unit_limit: i+10)
    Feature.create(name: "Feature #{(i+1)*3}", code: "Code #{i+2}", unit_price: i+2, max_unit_limit: i+15)
    FeaturePlan.create(plan_id: Plan.last.id, feature_id: Feature.last.id, allocated_units: i+3)
    FeaturePlan.create(plan_id: Plan.last.id, feature_id: Feature.second_to_last.id, allocated_units: i+2)
    Subscription.create(user_id: User.buyer.first.id, consumed_units: i+3, plan_id: Plan.last.id, feature_id: Feature.last.id)
    Subscription.create(user_id: User.buyer.first.id, consumed_units: i+4, plan_id: Plan.last.id, feature_id: Feature.second_to_last.id)
  end

puts "Seeding done."
