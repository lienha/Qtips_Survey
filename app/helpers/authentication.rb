helpers do
  def current_user
    if session[:user_id]
      begin
        @user ||= User.find(session[:user_id])
      rescue
        @user = nil
      end
    end
  end

  def not_signed_in?
    if current_user.nil?
      redirect to('/')
    end
  end
end
