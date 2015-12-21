namespace :db do
	desc "Generate users"
	task populate: :environment do
		# Generate fixed users Yitao
		yitao 	= User.create(name: "Yitao", email: "yitao@example.com", password: "secret", password_confirmation: "secret")
		ed 	= User.create(name: "ed", email: "ed@example.com", password: "secret", password_confirmation: "secret")

		#  Generate 98 additional random users
		user = [ yitao, ed ]
		user += 98.times.collect do |i|
			name = "#{Faker::Name.first}#{i}"
			email = "#{name}@example.com"
			password = Faker::Internet.password
			user   = User.create(name: name, email: email, password: password, password_confirmation: password)
		end

		# Randomize user create_at timestamp
		users.each { |user| user.update( create_at: Date.today - rand(30) ) }

		# Generate random posts
		posts = (10*users.count).times.collect do
			(users.sample).posts.create!(content: Faker::Lorem.sentence)
		end
	end	
end