class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permmited_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # 【メモ】環境変数を使用
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permmited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_kanji, :first_kanji, :last_kana, :first_kana, :birthday])
  end
end
