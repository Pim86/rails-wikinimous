Article.destroy_all
puts "Creating 10 articles..."
10.times do
  Article.create!(
    title: Faker::Quote.famous_last_words,
    content: Faker::JapaneseMedia::StudioGhibli.quote
  )
end
puts "Done! :)"
