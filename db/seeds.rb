5.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

User.all.each do |user|
	Survey.create(title: Faker::Hacker.adjective, creator: user)
end

Survey.all.each do |survey|
	5.times do 
		Question.create(question: Faker::Lorem.sentence, survey: survey)
	end
end

Question.all.each do |question|
	4.times do
		Answer.create(answer: Faker::Lorem.word, question: question)
	end
end

User.all.each do |user|
	Survey.all.each do |survey|
		Sample.create(complete?: false, voter: user, survey: survey)
	end
end


User.all.each do |user|
	user.samples.each do |sample|
		sample.survey.questions.each do |question|
			Response.create(answer: question.answers.sample, sample: sample)
		end
	end
end