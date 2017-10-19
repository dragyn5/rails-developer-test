# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |x|
  user = User.new
  user.email = "test#{x + 1}@test.com"
  user.encrypted_password = '111111'
  user.password = '111111'
  case x
    when 0
      @role = "user"
    when 1
      @role = "editor"
    when 2
      @role = "admin"
  end
  user.roles =  @role
  user.save!
end

puts "created 3 users with test1@test.com and password being 111111"

@category1 = Category.create(title: "Movies") 
@category2 = Category.create(title: "Music") 
@category3 = Category.create(title: "Cars") 

puts "created 3 Categories"

6.times do |x|
  @articles = Article.create(title: "Star Wars #{x}", content: 'Star wars is an awesome movie with amazing characters', category_id: @category1.id, user_id: 2)
end

6.times do |x|
  @articles = Article.create(title: "Katy Perry #{x}", content: 'Your a shooting star', category_id: @category2.id, user_id: 2)
end

puts "created 12 articles for user 2 (editor)"

6.times do |x|
  @articles = Article.create(title: "Mustang #{x}", content: 'Beast of a car', category_id: @category3.id, user_id: 3)
end

puts "created 6 articles for user 3 (admin)"
