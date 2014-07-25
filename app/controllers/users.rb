get "/sign_up" do
  @user = User.new
  erb :"users/sign_up"
end

post "/sign_up" do
  @user = User.new(params[:user])
  if @user.save
    redirect to('/')
  else
    erb :"users/sign_up"
  end
end

get "/sign_in" do
  @error = session.delete(:error)
  erb :"users/sign_in"
end

get '/users/welcome' do
  erb :"/users/welcome"
end

post "/sign_in" do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to('users/welcome')
  else
    session[:error] = 'Invalid email or password.'
    redirect to('/sign_in')
  end
end

delete "/sign_out" do
  session.delete(:user_id)
  redirect to('/')
end