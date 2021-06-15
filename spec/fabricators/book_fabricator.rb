Fabricator(:book) do
  title { Faker::Book.title }
  description { Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 7) }
  author { Faker::Book.author }
  # image { "#{Rails.root}/spec/fixtures/cover.png" }
  # image(count: 1)
end