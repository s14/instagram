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
    unless current_user == @photo.owner || current_user.email == "raghu@example.com"
      redirect_to root_url, :notice => "Nice try, suckah!"
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.all.order("created_at DESC")

    respond_to do |format|
      format.html do
        render('index')
      end

      format.json do
        render(:json => @photos)
      end
    end
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    @photo.user_id = current_user.id

    if @photo.save
      redirect_to photos_url, :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @photo.update_attributes(photo_params)

    @photo.user_id = current_user.id

    if @photo.save
      redirect_to photos_url, :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, :notice => "Photo deleted." }
      format.js
    end

  end

  def photo_params
    return params[:photo].permit(:caption, :photo_file)
  end
end
