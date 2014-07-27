get '/surveys' do
	@surveys = Survey.all
	erb :"surveys/index"
end

get '/surveys/view' do 
  if current_user
    @my_surveys = @user.surveys
  
    erb :"surveys/my_surveys"
  else
    erb :"users/sign_in"
  end
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
    @taken = true
    @title = Survey.find(@sample.last.survey_id).title
		return erb :"surveys/stats", layout: false
	else
	 Sample.create(voter: @user, survey: @survey)
	 @question = @survey.questions.first
	 @answers = @question.answers
	 erb :"surveys/show", layout: false
  end
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