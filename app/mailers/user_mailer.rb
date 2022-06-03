class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    attachments.inline['filename.jpg'] = File.read("/home/tejasgamit/RailsPractical3/public#{@user.picture.url}")        
    mail(to: @user.email, subject: 'Welcome to Our Community')
  end

  def update_mail
    @user = params[:user]
    mail(to: @user.email, subject: "A new #{@user.class} has been updated")
  end
end
