# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Like.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
cities = ["Paris", "Rennes", "Nantes", "Bordeaux", "Tours", "Toulouse", "Montpellier", "Strasbourg", "Marseille", "Lille"]
n = 0

10.times do 
	City.create!(
		name: cities[n]
		)
	n += 1
end

n = 0
10.times do
	User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email, 
		description: Faker::Movies::Lebowski.quote + "\n" * 3,
		age: rand(18..35),
		password: Faker::Code.ean,
		city: City.find(City.first.id + n)
		)
	n += 1
end

10.times do
	User.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		email: Faker::Internet.email, 
		description: Faker::Movies::Lebowski.quote + "\n" * 3,
		password: Faker::Code.ean,
		age: rand(18..35),
		city: City.all.sample
		)
end

 n = 0
20.times do
	Gossip.create!(
		title: Faker::Hipster.word,
		content: Faker::Quote.most_interesting_man_in_the_world,
		date: Faker::Date.between(from: 60.days.ago, to: Date.today).strftime("Créé le %d/%m/%Y"),
		user: User.find(User.first.id + n)
		)
	n += 1
end

10.times do
	Gossip.create!(
		title: Faker::Hipster.word,
		content: Faker::Quote.most_interesting_man_in_the_world,
		date: Faker::Date.between(from: 60.days.ago, to: Date.today).strftime("Créé le %d/%m/%Y"),
		user: User.all.sample
		)
end

100.times do
	Like.create!(
		user: User.all.sample,
		gossip: Gossip.all.sample
		)
end

100.times do
	Comment.create!(
		user: User.all.sample,
		gossip: Gossip.all.sample,
		date: Faker::Date.between(from: 60.days.ago, to: Date.today),
		content: Faker::Movies::Lebowski.quote
		)
end

City.create!(
	name: "AnonymousCity"
	)

User.create!(
	first_name: "Ano",
	last_name: "Nymous",
	email: "ano.nymous@gmail.com", 
	description: " We are Anonymous. We are Legion. We do not forgive. We do not forget. Expect us.", 
	age: 99,
	password: "anonymous",
	city: City.find_by(name: "AnonymousCity")
	)