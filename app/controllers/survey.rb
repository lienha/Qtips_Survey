get '/surveys' do
	erb :"surveys/index"
end

get '/surveys/:survey_id' do
	id = params[:survey_id]
	redirect '/surveys/#{id}/questions/1'
end

get '/surveys/:survey_id/questions/:question_id' do
	survey = params[:survey_id]
	question = params[:question_id]
	erb :"surveys/show"
end

