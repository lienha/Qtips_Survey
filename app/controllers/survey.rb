get '/surveys' do
	@surveys = Survey.all
	erb :"surveys/index"
end

get "/surveys/stats" do
	current_user
	@samples = Sample.where(voter: @user)
	
	erb :'surveys/stats'
end

get '/surveys/:survey_id' do
	current_user
	@survey = Survey.find(params[:survey_id]) 
	@sample = Sample.where(voter: @user, survey: @survey)
	if !@sample.empty?
		return redirect 'surveys/stats'
	end
	Sample.create(voter: @user, survey: @survey)
	@question = @survey.questions.first
	@answers = @question.answers
	erb :"surveys/show", layout: false
end

<<<<<<< HEAD
# get '/surveys/:survey_id/questions/:question_id' do
# 	survey = params[:survey_id]
# 	question = params[:question_id]
# 	@question = Question.find(question)
# 	@survey = Survey.find(survey)
# 	@answers = @question.answers
# 	erb :"surveys/show"
# end


=======
>>>>>>> f615e24fc836bdc78ce831be27c298e2bdf00d6d
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