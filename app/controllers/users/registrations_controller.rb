# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # sign_up parameter :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day
  before_action :configure_permitted_parameters, if: :devise_controller?


  def index
  end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  
  def new
    super
  end

  # POST /resource
  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end

    @user = User.new(user_params)
    if @user.save
      personal_params = personal_user_params.merge(user_id:@user.id)
      @personal_user = PersonalUser.new(personal_params)
      if @personal_user.save
        flash[:notice]='会員登録出来ました！'
      redirect_to "/signup/registration/#{@user.id}"
      bypass_sign_in(@user)
      else
      render :new
      end
    else
      render :new
    end

    # @personal_user = Personal_user.new(personal_user_params)
    # if @user.save
    #   redirect_to "/signup/registration/#{@user.id}"
    #   bypass_sign_in(@user)
    # else
    #   render :new
    # end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def user_params
    params.permit(:nick_name, :email, :password)
  end

  def personal_user_params
    params.permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day)
    
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day])
  end

  # private
  # def customize_sign_up_params
  #   devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]
  # end

  # def check_captcha
  #   self.resource = resource_class.new sign_up_params
  #   resource.validate
  #   unless verify_recaptcha(model: resource)
  #     respond_with_navigational(resource) { render :new }
  #   end
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
