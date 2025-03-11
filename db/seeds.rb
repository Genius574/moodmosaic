# db/seeds.rb

# First, delete all contents that reference moods
Content.delete_all

# Then delete all old data from moods, users, and categories
Mood.delete_all
User.delete_all
Category.delete_all

puts "All old data has been destroyed."

# Create Categories
uplifting_category = Category.create(name: 'Uplifting')
emotional_category = Category.create(name: 'Emotional')
calming_category = Category.create(name: 'Calming')
serious_category = Category.create(name: 'Serious')

puts "Categories created: Uplifting, Emotional, Calming, Serious"

# Create Users
user1 = User.create(email: 'siza@mood.com', password: 'password123', first_name: 'Siza', last_name: 'Mpafa')
user2 = User.create(email: 'genius@mood.com', password: 'password123', first_name: 'Genius', last_name: 'Chakurira')
user3 = User.create(email: 'moodmosaic@mood.com', password: 'password123', first_name: 'Mood', last_name: 'Mosaic')


puts "Users created: John, Jane, Alice"

# Create Moods and associate them with users and categories
mood1 = Mood.create(user: user1, category: uplifting_category, feeling: "happy")
mood2 = Mood.create(user: user2, category: emotional_category, feeling: "meh")
mood3 = Mood.create(user: user3, category: calming_category, feeling: "sad")
mood4 = Mood.create(user: user1, category: uplifting_category, feeling: "happy")
mood5 = Mood.create(user: user3, category: serious_category, feeling: "meh")
mood6 = Mood.create(user: user1, category: serious_category, feeling: "happy")
mood7 = Mood.create(user: user3, category: calming_category, feeling: "meh")
mood8 = Mood.create(user: user2, category: emotional_category, feeling: "sad")
mood9 = Mood.create(user: user1, category: uplifting_category, feeling: "meh")
mood10 = Mood.create(user: user2, category: emotional_category, feeling: "happy")
mood11 = Mood.create(user: user2, category: calming_category, feeling: "sad")

puts "Moods created for users."

# Create Contents and associate them with moods and categories
Content.create!(content_type: "spotify", category: uplifting_category, title: "Feel Good Vibes", url: "#")
Content.create!(content_type: "youtube", category: emotional_category, title: "Feeling Down", url: "#")
Content.create!(content_type: "blogs", category: calming_category, title: "Relaxing Music", url: "#")
Content.create!(content_type: "youtube", category: uplifting_category, title: "Positive Energy", url: "#")
Content.create!(content_type: "blogs", category: serious_category, title: "Tough Decisions", url: "#")
Content.create!(content_type: "spotify", category: serious_category, title: "Serious Talk", url: "#")
Content.create!(content_type: "blogs", category: calming_category, title: "Peaceful Moments", url: "#")
Content.create!(content_type: "youtube", category: emotional_category, title: "Sad but True", url: "#")
Content.create!(content_type: "spotify", category: uplifting_category, title: "Inspiration", url: "#")
Content.create!(content_type: "blogs", category: emotional_category, title: "Brighten Your Day", url: "#")
Content.create!( content_type: "youtube", category: calming_category, title: "Meditative Sounds", url: "#")

puts "Contents created for moods and categories."
puts "#{Content.count} contents were created!"
