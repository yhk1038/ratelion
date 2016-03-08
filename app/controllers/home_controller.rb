class HomeController < ApplicationController
  
  before_action :is_signin?, except: [:intro, :error]
  before_action :is_admin?, only: [:admin2]
  
  def admin2
    Apply.all.each do |x|
      if x.ranks.count == 0
        r = Rank.new
        r.apply_id = x.id
        r.save
      else
        r = x.ranks.first
      end
      t = 0
      x.rates.each do |y|
        t += y.point1 + y.point2 + y.point3 + y.point4 + y.point5
      end
      r.num = x.rates.count
      r.total = 0
      r.total = t
      r.score = 0
      r.score = t / x.rates.count
      r.save
    end
    
  end
  
  def adminc
    session[:admin] = '2015' if params[:pwd] == '2816'
    redirect_to '/home/index'
  end
  
  def index
    member = Array.new
    member = ['김용현','박현민','전민호','윤세영','정예원','류진이','이재철','최병재']
    @mbr = member
  end

  def intro
    # if is_signin?
    #   redirect_to '/home/index'
    #   return
    # end
  end
  
  def save_apply
    if params[:id] == nil
      oh = Apply.new
    else
      oh = Apply.find(params[:id])
    end
    
    oh.apply_num    = params[:apply_num]
    oh.name         = params[:name]
    oh.student_id   = params[:student_id]
    oh.major        = params[:major]
    oh.email        = params[:email]
    oh.phonenumber  = params[:phonenumber]
    oh.sex          = params[:sex]
    oh.age          = params[:age]
    oh.file         = params[:file]
    oh.file2        = params[:file2]
    oh.etc          = params[:etc]
    oh.rated        = params[:rated]
    oh.save
    
    redirect_to '/home/index'
  end
  
  def delete_apply
    oh = Apply.find(params[:id])
    oh.delete
    redirect_to '/home/index'
  end
  
  def rate
    @lion = Apply.find(params[:id])
    @rates = @lion.rates.all
    
  end
  
  def save_rate
    if params[:mod].to_i == 0
      t = Rate.new
    else
      t = Rate.find(params[:mod])
      if t.nil?
        flash[:error] = "존재하지 않는 평가정보입니다."
        redirect_to '/error'
        return
      end
    end
    
    ## BASE
    t.apply_id  = params[:apply_id]
    t.user_name = params[:user_name]
    
    ## 평가기준
    t.point1    = params[:point1]
    t.point2    = params[:point2]
    t.point3    = params[:point3]
    t.point4    = params[:point4]
    t.point5    = params[:point5]
    
    ## 심사평
    t.comment   = params[:comment]
    
    t.save
    
    redirect_to '/home/rate/' + params[:apply_id].to_s
  end
  
  def delete_rate
    oh = Rate.find(params[:id])
    ohoho = oh.apply_id
    oh.delete
    redirect_to "/home/rate/#{ohoho}"
  end
end
