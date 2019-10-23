module SessionsHelper
  
  def now_user
    @now_user ||= User.find_by(id: session[:user_id])
  end
  
  
  def log_in?
    if now_user
      return true
    else
      return false
    end
  end
end  