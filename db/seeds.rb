# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'pierre@michaux.com', password: 'progenitor')
User.create(email: Faker::Internet.email, password: Faker::Internet.password)

8.times { Category.create(title: Faker::Lorem.word.capitalize) }

10.times do
  Bicycle.create(
      name: Faker::Lorem.word.capitalize,
      description: Faker::Lorem.paragraph(15),
      user: User.first,
      category: Category.find(Category.pluck(:id).shuffle.first)
  )
end

5.times do
  Suggestion.create(
      name: Faker::Lorem.word.capitalize,
      description: Faker::Lorem.paragraph(15),
      user: User.last,
      bicycle: Bicycle.find(Bicycle.pluck(:id).shuffle.first)
  )
end