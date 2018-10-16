module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # binding.pry
  end

  def logged_in?
    current_user.present?
    #ユーザーがログインしていればtrue、それ以外ならfalseを返す
  end
end
