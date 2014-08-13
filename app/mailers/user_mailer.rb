class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def favorite_notification(the_favoriting)
    @photo = the_favoriting.photo
    @owner = @photo.owner
    @favorited_by = the_favoriting.user

    mail(:to => @owner.email, :subject => "Someone likes your photo")
  end


end
