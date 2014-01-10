class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
  private :resource_params
end
