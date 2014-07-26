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