# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def new
    @user = User.new
    @personal_user = PersonalUser.new
  end

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end

    @user = User.new(user_params)
    if @user.save
      personal_params = personal_user_params.merge(user_id: @user.id)
      @personal_user = PersonalUser.new(personal_params)
      if @personal_user.save
        # binding.pry
        flash[:notice]='会員登録出来ました！'
        redirect_to "/signup/registration/#{@user.id}"
        bypass_sign_in(@user)
      else
        # render :new
        redirect_to '/signup/registration'
      end
    else
      # render :new
      redirect_to '/signup/registration'
    end

    def callback
      auth = request.env['omniauth.auth']
      user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_facebook(auth)
      session[:user_id] = user.id
      redirect_back_or root_path
    end
  end

  protected
  def user_params
    params.require(:user).permit(:nick_name, :email, :password)
  end

  def personal_user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day])
  end
end
