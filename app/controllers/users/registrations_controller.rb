class Users::RegistrationsController < Devise::RegistrationsController

  def build_resource(*args)
    super
  end
end
