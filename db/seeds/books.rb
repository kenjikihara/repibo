10.times do |n|
  title = Faker::Book.title
  content = Faker::Address.city
  Book.create!(title: title,
               content: content,
               tag_list: "vehicle",
               image: Rails.root.join("db/fixtures/images/harapeko_test.jpg").open,
               user_id: 2,
               )
end