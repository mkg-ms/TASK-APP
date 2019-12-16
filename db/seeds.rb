# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
User.create!( name: "ゲスト管理者",
              email: "guest-admin@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
User.create!( name: "ゲストユーザー",
              email: "guest@email.com",
              password: "password",
              password_confirmation: "password")
              
              
97.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(3)
50.times do |n|
  name = "タスク#{n+1}"
  content = "タスク詳細#{n+1}"
  users.each { |user| user.tasks.create!(name: name, content: content) }
end
