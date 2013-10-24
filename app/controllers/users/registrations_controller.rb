class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def build_resource(*args)
    super
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  private :sign_up_params
end
