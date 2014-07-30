module ApplicationHelper
  def say_hi(person)
    return "<h1>Howdy #{person}!</h1>".html_safe
  end

  # Returns the URL for the show page of a photo
  def photo_url(object)
    if object.class == Photo
      return "/photos/#{object.id}"
    else
      return "/photos/#{object}"
    end
  end

  # Returns the URL for the edit page of a photo
  def edit_photo_url(object)
    return "/photos/#{object.id}/edit"
  end

  # Returns the URL to delete a photo
  def delete_photo_url(object)
    return "/delete_photo/#{object.id}"
  end
end
