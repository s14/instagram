module ApplicationHelper
  def say_hi(person)
    return "<h1>Howdy #{person}!</h1>".html_safe
  end

  # Define a method that returns a string like: '/photos/new'
  def new_photo_url

  end

  # Define a method that returns a string like: '/photos'
  def photos_url

  end

  # Define a method that returns a string like: '/photos/:id'
  def photo_url(object)

  end

  # Define a method that returns a string like: '/photos/:id/edit'
  def edit_photo_url(object)

  end
end
