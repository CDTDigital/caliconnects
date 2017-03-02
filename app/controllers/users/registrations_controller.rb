class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_scope!, except: [:new, :create, :confirmation]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do |user|
      if user.persisted?
        user.addresses.create(address_params) if address_params_present?

        SmsService.new.send_message(user.phone, "Thanks for registering for the Shiny Fawn service! Click this link to confirm your registration: " + user_success_url)
      end
    end
  end

  def confirmation
  end

  def success
  end

  def edit
    super
  end

  def update
    super do |user|
      user.addresses.first.update(address_params) if user.addresses.first

      user.addresses.create(address_params) if (address_params_present? && !user.addresses.first)
    end
  end

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

  # protected

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def address_params
    params.permit(:state, :zipcode, :city).merge(street: params[:street] + " " + params[:route])
  end

  def address_params_present?
    params[:street] && params[:route] && params[:state] && params[:zipcode] && params[:city]
  end

  def after_sign_up_path_for(resource)
    user_confirmation_path
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :first_name, :last_name])
  end
end
