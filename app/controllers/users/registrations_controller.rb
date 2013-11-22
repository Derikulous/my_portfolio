class Users::RegistrationsController < Devise::RegistrationsController

  def build_resource(*args)
    super
    if resource.valid?
      begin
        resource.transaction do
          resource.save!
        end
        UserMailer.signup_confirmation(@user).deliver unless @user.invalid?
      end
    end
  end
end
