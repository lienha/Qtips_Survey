get '/surveys' do
	erb :"surveys/index"
end

get '/surveys/:survey_id' do
	id = params[:survey_id]
	first_question = Survey.find(id).questions.first.id
	redirect "/surveys/#{id}/questions/#{first_question}"
end

get '/surveys/:survey_id/questions/:question_id' do
	survey = params[:survey_id]
	question = params[:question_id]
	erb :"surveys/show"
end

post '/surveys/:survey_id/questions/:question_id' do
	survey = params[:survey_id]
	question = params[:question_id]
	if question_count(question)
		next_question = question + 1
		redirect "/surveys/#{survey}/questions/#{next_question}"
	else
		redirect '/surveys'
	end
end