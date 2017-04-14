# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

fiorina = User.create! username: "Fiorina", password_digest: "as7905"
fiorina.create_profile! first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female"

trump = User.create! username: "Trump", password_digest: "iouerw"
trump.create_profile! first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male"

carson = User.create! username: "Carson", password_digest: "k2h38a"
carson.create_profile! first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male"

clinton = User.create! username: "Clinton", password_digest: "pa9g82"
clinton.create_profile! first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female"

User.all.each_with_index do |user, i|
	todoList = user.todo_lists.create! list_name: "list #{i}", list_due_date: Date.today+1.year
	(1..5).each do |i|
		todoList.todo_items.create! due_date: Date.today+1.year, title: "title #{i}", description: "This is task #{i}"
	end
end