get '/create' do 
  if current_user
    erb :"surveys/create"
  else
    redirect '/'
  end
end

post '/create' do
  if current_user 
    title = params[:title]
    questions = params[:questions]
    answers = params[:answers]
    new_survey = Survey.create(title: title)
    questions.each_index do |i|
      q = Question.create(question: questions[i])
      answers[i.to_s].each do |a|
        a = Answer.create(answer: a, question_id: q.id)
      end
      new_survey.questions << q
    end
    @user.surveys << new_survey
    content_type :json
    {message: true}.to_json
  else
    content_type :json
    {message: false}.to_json
  end
end