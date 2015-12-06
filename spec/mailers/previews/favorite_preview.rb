# Preview all emails at http://localhost:3000/rails/mailers/favorite
class FavoritePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/favorite/Mailer
  def Mailer
    Favorite.Mailer
  end

end
