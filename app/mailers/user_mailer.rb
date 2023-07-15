class UserMailer < ApplicationMailer
  default from: 'no-reply@mangasama.fr'

  def welcome_mail (user)
    # On recupère le user pour pouvoir le passer à la view en @user
    @user = user

    # @url, variable qu'on utilisera dans la view d'email
    @url = 'http://mangasama.fr/login'

    # Appel à mail (), méthode qui permet d'envoyer l'email en définissat destinataire et sujet
    mail(to: @user.email, subject: 'Bienvenu chez nous !')
  end

end
