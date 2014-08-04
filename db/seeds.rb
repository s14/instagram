# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.username = "rugb"
user.avatar_url = "https://graph.facebook.com/rbetina/picture"
user.email = "raghu@example.com"
user.password = "colts123"
user.password_confirmation = "colts123"
user.save

user = User.new
user.username = "jack"
user.avatar_url = "https://graph.facebook.com/jack.mallers/picture"
user.email = "jack@example.com"
user.password = "lions123"
user.password_confirmation = "lions123"
user.save

puts "There are now #{User.count} users."

photo_hashes = [
  { :caption => "Peyton Manning", :filename => "pm.jpg" },
  { :caption => "Drew Brees", :filename => "db.jpg" },
  { :caption => "Aaron Rodgers", :filename => "ar.jpg" },
  { :caption => "Cam Newton", :filename => "cn.jpg" },
  { :caption => "Matt Stafford", :filename => "ms.jpg" },
  { :caption => "Andrew Luck", :filename => "al.jpg" },
  { :caption => "Russell Wilson", :filename => "rw.jpg" },
  { :caption => "Colin Kaepernick", :filename => "ck.jpg" },
  { :caption => "Tom Brady", :filename => "tb.jpg" }
]

photo_hashes.each do |photo_hash|
  photo = Photo.new
  photo.caption = photo_hash[:caption]
  photo.photo_file = File.open(Rails.root.join("lib", "assets", "seeds", photo_hash[:filename]))

  random_user = User.offset(rand(User.count)).limit(1).first
  photo.user_id = random_user.id
  photo.save
end

puts "There are now #{Photo.count} photos."

raghus_favoritings = ["Peyton Manning", "Andrew Luck"]
jacks_favoritings = ["Matt Stafford", "Tom Brady"]

raghus_favoritings.each do |player_name|
  favoriting = Favoriting.new
  favoriting.user_id = User.find_by({ :username => "rugb" }).id
  favoriting.photo_id = Photo.find_by({ :caption => player_name }).id
  favoriting.save
end

jacks_favoritings.each do |player_name|
  favoriting = Favoriting.new
  favoriting.user_id = User.find_by({ :username => "jack" }).id
  favoriting.photo_id = Photo.find_by({ :caption => player_name }).id
  favoriting.save
end

puts "There are now #{Favoriting.count} favoritings."

comments = [
  "He's great!",
  "He's okay",
  "Getting better",
  "First pick",
  "Never!"
]

Photo.all.each do |photo|
  comment = Comment.new
  comment.photo_id = photo.id
  comment.content = comments.sample
  random_user = User.offset(rand(User.count)).limit(1).first
  comment.user_id = random_user.id
  comment.save
end

puts "There are now #{Comment.count} comments."

following = Following.new
following.follower_id = User.find_by({ :username => "rugb" }).id
following.leader_id = User.find_by({ :username => "jack" }).id
following.save

puts "There are now #{Following.count} followings."
