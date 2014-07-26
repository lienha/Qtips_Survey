get '/surveys' do
	@surveys = Survey.all
	erb :"surveys/index"
end

get '/surveys/:survey_id' do
	current_user
	@survey = Survey.find(params[:survey_id]) 
	Sample.find_or_create_by(voter: @user, survey: @survey)
	@question = @survey.questions.first
	@answers = @question.answers
	erb :"surveys/show", layout: false
end

# get '/surveys/:survey_id/questions/:question_id' do
# 	survey = params[:survey_id]
# 	question = params[:question_id]
# 	@question = Question.find(question)
# 	@survey = Survey.find(survey)
# 	@answers = @question.answers
# 	erb :"surveys/show"
# end

post '/surveys/:survey_id/questions/:question_id' do
	find_current_question(params[:answer_id])
	if question_count(@question)
		next_question = @question.id + 1
		@question = Question.find(next_question)
		@answers = @question.answers
		content_type = "html"
		erb :"surveys/show", layout: false
	else
		@surveys = Survey.all
		content_type = "html"
		erb :"surveys/index", layout: false
	end
end