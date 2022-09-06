class ApplicationController < ActionController::Base

  # 以下の記述でcurrent_userがuserがviewでも使えるようになる
  helper_method :current_user

  # ログインしていない人の遷移先を指定
  def login?
    if current_user.nil?
      redirect_to login_path, alert: 'ログインが必要です。'
    end
  end

  # すでにログインしている人の遷移先を指定
  def already_login?
    unless current_user.nil?
      redirect_to user_path, notice: '既にログインしています。'
    end
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
end
