# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Post.destroy_all
Category.destroy_all
User.destroy_all
Comment.destroy_all
PostCategory.destroy_all

20.times do
  Category.create(name: Faker::Book.genre)
end

20.times do
  Post.create(title: Faker::Book.title, content: Faker::Lorem.paragraph)
end

20.times do
  User.create(username: Faker::Internet.username, email: Faker::Internet.email)
end

40.times do
  Comment.create(content: Faker::Hipster.sentence, user_id: User.all.sample.id, post_id: Post.all.sample.id)
end

40.times do
  PostCategory.create(post_id: Post.all.sample.id, category_id: Category.all.sample.id)
end