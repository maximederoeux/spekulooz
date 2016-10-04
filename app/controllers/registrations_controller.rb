class RegistrationsController < Devise::RegistrationsController

  # skip_before_filter :verify_authenticity_token, :only => :create

  protected

  def after_sign_up_path_for(resource)
    edit_account_path(new_account)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :resto_name)
  end

  def new_account
  	current_user.accounts.first
  end
  
end