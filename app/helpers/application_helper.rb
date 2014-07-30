module ApplicationHelper
  def say_hi(person)
    return "<h1>Howdy #{person}!</h1>".html_safe
  end
end
