module ApplicationHelper
  # A silly example of a view helper method
  def say_hi(person)
    return "<h1>Howdy #{person}!</h1>".html_safe
  end


  # URL Helper Methods for the Photo resource:
  # Define a method that returns the string '/photos/new'
  def new_photo_url
    return "/photos/new"
  end

  # Define a method that returns the string '/photos'
  def photos_url
    return "/photos"
  end

  # Define a method that returns a string like '/photos/6'
  #   (based on the id of the object passed in as an argument)
  def photo_url(the_object)
    return "/photos/#{the_object.id}"
  end

  # Define a method that returns a string like '/photos/6/edit'
  #  (based on the id of the object passed in as an argument)
  def edit_photo_url(the_object)
    return "/photos/#{the_object.id}/edit"
  end

  # HOMEWORK:
  # Add 4 similar URL Helper Methods for each of the other resources
  #   Comments, Favoritings, Followings, and Users
end
