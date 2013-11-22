class UserMailer < ActionMailer::Base
  default from: "derik.strattan@gmail.com"

  def signup_confirmation(user)
    @user = user
    @email = user.email
    attachments["yellowstone.jpg"] = File.read("#{Rails.root}/app/assets/images/yellowstone.jpg")
    mail(to: @user.email, subject: "Thank you for using our services.")
  end
end
