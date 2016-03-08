class UserController < ApplicationController
  
  def seed
    if User.count < 5
      member =  ['김용현',  '박현민', '전민호', '윤세영', '정예원', '류진이', '이재철', '최병재']
      pwd =     ['2016',    '1523',   '6547',   '1163',   '5831',   '7785',   '9646',   '3342']
      i=0
      member.each do |x|
        u = User.new
        u.name = x
        u.pwd = pwd[i]
        u.save
        i+=1
      end
    end
    redirect_to '/'
  end
  
  def del
    User.all.each do |x|
      x.delete
    end
    redirect_to '/'
  end
  
  def sign_in
    if params[:user_id].nil? || params[:password].nil? || params[:user_id].empty? || params[:password].empty?
      flash[:error] = "잘못된 이메일이나 비밀번호를 입력했습니다."
      redirect_to :back
    end
    u = User.where(name: params[:user_id], pwd: params[:password]).first
    if u.nil?
      flash[:error] = "잘못된 이메일이나 비밀번호를 입력했습니다."
      redirect_to :back
    else
      session[:user_id] = u.id
      redirect_to '/home/index'
    end
  end

  def sign_up
    # if params[:user_id].nil? || params[:password].nil? || params[:user_id].empty? || params[:password].empty?
    #   flash[:error] = "잘못된 이메일이나 비밀번호를 입력했습니다."
    #   redirect_to :back
    # else
      u = User.new
      u.user_id = params[:user_id]
      u.password = params[:password]
      u.save
      session[:user_id] = u.user_id
      redirect_to '/home/index'
    # end
  end

  def sign_out
    reset_session
    redirect_to '/'
  end

  def delete_account
    current_user.delete
    reset_session
    redirect_to '/'
  end

  def mod_pwd
    if params[:pwd]
      u = current_user
      u.pwd = params[:pwd]
      u.save
      redirect_to '/home/index'
    else
      flash[:error] = "비번입력하셈"
      redirect_to :back
    end
  
  end

  def mod_user
    s = current_user
    arr = User.attribute_names
    arr.each do |x|
        next if x=="id" || x=="created_at" || x=="updated_at"
        eval("s.#{x} = params[:#{x}] unless params[:#{x}].nil?")
    end
    s.save
    
    redirect_to '/home/index'
  end
end
