helpers do
	def question_count(question)
		q = question
		last_id = q.survey.questions.last.id
		q.id != last_id
	end

	def find_current_question(answer_id)
		@answer = Answer.find(answer_id)
		@question = @answer.question
		@survey = @question.survey
	end

	def save_response(user, survey, answer)
		@sample = Sample.where(voter: user, survey: survey).first
		Response.create(sample: @sample, answer: @answer)
	end

	def complete_survey(user, survey)
		@sample = Sample.where(voter: user, survey: survey).first
		@sample.update(complete?: true)
	end
end