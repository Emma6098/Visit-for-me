# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.last
    UserMailer.with(user: user).welcome
  end

  def welcome_preview
    user = User.last
    UserMailer.welcome_preview
  end

end
