class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  helper_method :current_user
  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if session[:user_id]
      u = User.where(id: session[:user_id]).first
      if u.nil?
        session[:user_id]=
        nil
      else
        u
      end
    else
      nil
    end
    
  end
  
  
  #로그인 되었는지 확인하는 function
  def is_signin?
    u = User.new
    if session[:user_id]
      u = User.where(id: session[:user_id]).first
      if u.nil?
        flash[:error] = "잘못된 사용자 입니다."
        reset_session
        redirect_to '/error'
      # elsif u.available == 0
      #   flash[:error] = "승인이 되지 않은 사용자입니다."
      #   reset_session
      #   redirect_to '/error'
      end
    else
      flash[:error] = "로그인이 필요한 서비스 입니다."
      redirect_to '/error'
    end
  end
  
  #관리자 권한을 확인하는 function
  def is_admin?
    if session[:admin] == '2015'
      true
    else
      flash[:error] = "관리자 권한이 필요한 서비스 입니다."
      redirect_to '/error'
    end
  end
  
end
