class PhotosController < ApplicationController
  before_action(:set_photo, { :only => [:show, :edit, :update, :destroy] })

  before_action(:ensure_current_user_is_photo_owner, { :only => [:edit, :destroy, :update] })

  # before_action(:ensure_admin, { :only => [:create] })

  # def ensure_admin
  #   if current_user.email != "raghu@example.com"
  #     redirect_to "/", :notice => "Must be site admin for that."
  #   end
  # end

  def ensure_current_user_is_photo_owner
    if current_user != @photo.owner || current_user.email != "raghu@example.com"
      redirect_to "/", :notice => "Nice try, suckah!"
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.image_url = params[:image_url]
    @photo.photo_file = params[:photo_file]
    @photo.caption = params[:caption]
    @photo.user_id = current_user.id

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @photo.photo_file = params[:photo_file]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end
end
