# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do
  FactoryBot.create(:user, role: 'itadmin')
end
2.times do
  FactoryBot.create(:user, role: 'owner')
end
3.times do
  FactoryBot.create(:user, role: 'manager')
end
4.times do
  FactoryBot.create(:user, role: 'cashier')
end
5.times do
  FactoryBot.create(:user, role: 'user')
end


10.times do
  FactoryBot.create(:supplier)
end


30.times do
  FactoryBot.create(:product)
end
