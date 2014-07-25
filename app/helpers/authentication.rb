helpers do
  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def not_signed_in?
    if current_user.nil?
      redirect to('/')
    end
  end
end
