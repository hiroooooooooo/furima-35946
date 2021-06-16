class ApplicationController < ActionController::Base
  before_action :configure_permmited_parameters, if: :devise_controller?

  private
  def configure_permmited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_kanji, :first_kanji, :last_kana, :first_kana, :birthday])
  end
  
end
