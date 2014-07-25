helpers do
	def question_count(question_id)
		q = Question.find(question_id)
		last_id = q.survey.questions.last.id
		question_id == last_id
	end
end
