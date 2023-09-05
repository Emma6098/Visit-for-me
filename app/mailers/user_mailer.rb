class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_preview
    mail to: "toto@gmail.com", subject: "Bonjour Toto !"
  end

  def welcome(user, review)
    @user = user
    @review = review
    mail(to: @user.email, subject: 'Nouveau commentaire reçu')
  end
end
