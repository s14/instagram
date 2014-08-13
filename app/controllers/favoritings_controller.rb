class FavoritingsController < ApplicationController
  def index
    @favoritings = Favoriting.all
  end

  def show
    @favoriting = Favoriting.find(params[:id])
  end

  def new
    @favoriting = Favoriting.new
  end

  def create
    @favoriting = Favoriting.new
    @favoriting.user_id = current_user.id
    @favoriting.photo_id = params[:photo_id]

    if @favoriting.save
      # send an email to the owner of the photo
      #   that was favorited

      UserMailer.favorite_notification(@favoriting).deliver

      redirect_to :back, :notice => "Photo added to your favorites!"
    else
      render 'new'
    end
  end

  def edit
    @favoriting = Favoriting.find(params[:id])
  end

  def update
    @favoriting = Favoriting.find(params[:id])

    @favoriting.user_id = params[:user_id]
    @favoriting.photo_id = params[:photo_id]

    if @favoriting.save
      redirect_to "/favoritings", :notice => "Favoriting updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favoriting = Favoriting.find(params[:id])

    @favoriting.destroy

    redirect_to :back, :notice => "Favoriting deleted."
  end
end
