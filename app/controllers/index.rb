# GET ==============================================================

get '/' do
  if current_user
    erb :"users/welcome"
  else
    erb :"users/sign_in"
  end
end
