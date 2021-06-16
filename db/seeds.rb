# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@zygo-books.com', password: 'admin123', password_confirmation: 'admin123') if Rails.env.development?

if Book.count.zero?
  10.times do
    b = Book.create(
      title: Faker::Book.title,
      description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 7),
      author: Faker::Book.author,
    )
    b.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "noimageavailable.png")), filename: 'file.png')
    b.save
  end
end