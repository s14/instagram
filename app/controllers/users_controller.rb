class UsersController < ApplicationController
  def timeline
    @photos = current_user.timeline_including_favorites.order("created_at DESC")



    respond_to do |format|
      format.html do
        render('photos/my_timeline')
      end

      format.json do
        render(:json => @photos)
      end
    end
  end

  def favorites
    @photos = current_user.favorite_photos.order("created_at DESC")

    respond_to do |format|
      format.html do
        render('photos/my_favorites')
      end

      format.json do
        render(:json => @photos)
      end
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.avatar_url = params[:avatar_url]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.username = params[:username]
    @user.avatar_url = params[:avatar_url]

    if @user.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
