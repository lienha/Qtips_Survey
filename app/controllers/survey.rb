get '/surveys' do
	@surveys = Survey.all
	erb :"surveys/index"
end

get '/surveys/:survey_id' do
	current_user
	@sample = Sample.where(voter: @user, survey: @survey)
	unless @sample.empty?
		redirect 'user/stats'
	end
	@survey = Survey.find(params[:survey_id]) 
	Sample.create(voter: @user, survey: @survey)
	@question = @survey.questions.first
	@answers = @question.answers
	erb :"surveys/show", layout: false
end

post '/surveys/:survey_id/questions/:question_id' do
	current_user
	@survey = Survey.find(params[:survey_id])
	@answer = Answer.find(params[:answer_id])
	save_response(@user, @survey, @answer)
	find_current_question(params[:answer_id])
	if question_count(@question)
		next_question = @question.id + 1
		@question = Question.find(next_question)
		@answers = @question.answers
		content_type = "html"
		erb :"surveys/show", layout: false
	else
		complete_survey(@user, @survey)
		@surveys = Survey.all
		content_type = "html"
		erb :"surveys/complete", layout: false
	end
end