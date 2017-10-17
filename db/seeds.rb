400.times do
  count = Faker::Number.between(1, 1300)
  url = Faker::Internet.url
  Url.find_or_create_by(visit_count: count, full_address: Faker::Internet.url)
end
