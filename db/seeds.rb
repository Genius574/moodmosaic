# db/seeds.rb
require 'open-uri'
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
Content.create!(content_type: "spotify", category: uplifting_category, title: "Feel Good Vibes", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "youtube", category: emotional_category, title: "Feeling Down", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "blogs", category: calming_category, title: "Relaxing Music", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "youtube", category: uplifting_category, title: "Positive Energy", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "blogs", category: serious_category, title: "Tough Decisions", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "spotify", category: serious_category, title: "Serious Talk", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "blogs", category: calming_category, title: "Peaceful Moments", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "youtube", category: emotional_category, title: "Sad but True", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "spotify", category: uplifting_category, title: "Inspiration", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "blogs", category: emotional_category, title: "Brighten Your Day", url: "#", mood_id: Mood.all.sample.id)
Content.create!( content_type: "youtube", category: calming_category, title: "Meditative Sounds", url: "#", mood_id: Mood.all.sample.id)
# Add motivational quotes for each category
# Uplifting Category Quotes
Content.create!(content_type: "quote", category: uplifting_category, title: "Believe in yourself, and remember that the hardest challenges often lead to the most rewarding achievements. Keep pushing forward, because your breakthrough is just around the corner.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: uplifting_category, title: "The best moments in life are yet to come, so stay hopeful and keep going. You are always one step closer to your dreams, even when it feels impossible.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: uplifting_category, title: "Every day is a chance for a fresh start, a new opportunity to rewrite your story. Don’t let past mistakes define you. The future is waiting for you.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: uplifting_category, title: "You may not always see it, but you are stronger than you think. Each small victory is a step toward becoming the best version of yourself.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: uplifting_category, title: "Surround yourself with positive energy and people who lift you up. Remember that a positive mindset attracts positive outcomes, and that’s the key to success.", url: "#", mood_id: Mood.all.sample.id)

# Emotional Category Quotes
Content.create!(content_type: "quote", category: emotional_category, title: "It's okay to feel sadness. Emotions are a natural part of life. Allow yourself to feel, and know that healing comes with time and acceptance.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: emotional_category, title: "Tears are not a sign of weakness. They are a reflection of the emotions we carry inside. It’s okay to cry; it’s just your heart speaking.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: emotional_category, title: "Remember, this moment of sadness is temporary. Whatever you are going through will pass, and brighter days are ahead if you keep moving forward with hope.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: emotional_category, title: "You are not defined by your sadness. It’s just one chapter in your story. It’s okay to not be okay, and it’s okay to ask for help.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: emotional_category, title: "Your feelings are real, and your emotions matter. Don't ignore them, but allow yourself the space to process and heal. You are stronger than you think.", url: "#", mood_id: Mood.all.sample.id)

# Calming Category Quotes
Content.create!(content_type: "quote", category: calming_category, title: "Take a deep breath, and remember that peace begins from within. Let go of the tension, and embrace calmness as you focus on the present moment.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: calming_category, title: "Serenity is not found in the world around you, but in the stillness of your heart. Close your eyes, breathe deeply, and find peace within.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: calming_category, title: "Sometimes the simplest things bring the most peace. A quiet moment, a deep breath, and a calm mind are all you need to reset and find balance.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: calming_category, title: "Let go of the things you cannot control, and release the weight of worry. True peace comes from knowing that not everything is yours to carry.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: calming_category, title: "Stay grounded in the present. The world can be chaotic, but you have the power to find calm within yourself. Embrace the stillness, and let it heal you.", url: "#", mood_id: Mood.all.sample.id)

# Serious Category Quotes
Content.create!(content_type: "quote", category: serious_category, title: "The future is shaped by the choices you make today. Don’t wait for the perfect moment to act. Start where you are, with what you have, and make it count.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: serious_category, title: "Life is full of challenges, but it’s through these challenges that we find the strength to grow. Embrace adversity and use it as fuel to build the life you desire.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: serious_category, title: "In the midst of struggle lies opportunity. Difficult times often lead to personal growth and transformation. Keep moving forward, and you’ll find your way through.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: serious_category, title: "Success is a journey, not a destination. It’s made up of small decisions that add up over time. Don’t be afraid of failure, for it teaches you what success really means.", url: "#", mood_id: Mood.all.sample.id)
Content.create!(content_type: "quote", category: serious_category, title: "Every decision you make sets the course for your future. Take ownership of your choices, and remember that you have the power to change your destiny with each step you take.", url: "#", mood_id: Mood.all.sample.id)

puts "Motivational quotes created based on moods and categories."

uplifting_images = [
  'https://images.unsplash.com/photo-1732058824460-d89cb7b4a38f?q=80&w=872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1674242189292-edce82b96e4b?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  # 'https://unsplash.com/photos/woman-in-black-and-white-checkered-long-sleeve-shirt-sitting-beside-man-in-green-crew-neck-l_ExpFwwOEg',
  # 'https://unsplash.com/photos/concrete-pathway-in-flower-garden-with-no-people-P7X8o2U66t4',
  # 'https://unsplash.com/photos/woman-in-black-pants-and-pink-shirt-standing-on-green-grass-field-during-daytime-n5trbdfW7fM'
]

moods = Mood.all
category = Category.where(name: 'Uplifting')
uplifting_images.each do |image|
  photo = Content.create(mood_id: moods.sample.id, category_id: category.all.sample.id, url: "image", content_type: "image")
  file = URI.parse(image).open
  photo.photo.attach(io: file, filename: "#{category.name} photo", content_type: "image/png")
end

# Emotional images URLs
emotional_images = [
  'https://images.unsplash.com/photo-1631816591249-ba33dde81a23?q=80&w=446&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1484639726803-f17534cedb15?q=80&w=421&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
#   'https://unsplash.com/photos/a-man-sitting-on-a-bench-with-his-head-down-nT2u--BJWlE',
#   'https://unsplash.com/photos/woman-in-black-shirt-covering-face-with-hands-3I0jy73l8u8'
 ]
category = Category.where(name: 'Emotional')
emotional_images.each do |image|
  photo = Content.create(mood_id: moods.sample.id, category_id: category.all.sample.id, url: "image", content_type: "image")
  file = URI.parse(image).open
  photo.photo.attach(io: file, filename: "#{category.name} photo", content_type: "image/png")
end

# Calming images URLs
calming_images = [
  'https://images.unsplash.com/photo-1610401840013-8bb7cb17c738?q=80&w=327&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  # 'https://unsplash.com/photos/white-cat-sleeps-under-white-comforter-uy5t-CJuIK4',
  # 'https://unsplash.com/photos/white-clouds-and-blue-sky-during-daytime-xNtwmcRP-gw'
]
category = Category.where(name: 'Calming')
calming_images.each do |image|
  photo = Content.create(mood_id: moods.sample.id, category_id: category.all.sample.id, url: "image", content_type: "image")
  file = URI.parse(image).open
  photo.photo.attach(io: file, filename: "#{category.name} photo", content_type: "image/png")
end

# Serious images URLs
serious_images = [
  'https://images.unsplash.com/photo-1573339607881-208e75e4b267?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1628493706977-cf588f61c5fc?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  # 'https://unsplash.com/photos/abandoned-building-_DAY5kuDvsU',
  # 'https://unsplash.com/photos/burning-woods-during-night-time-YEsxGmZ4wLU'
]
category = Category.where(name: 'Serious')
serious_images.each do |image|
  photo = Content.create(mood_id: moods.sample.id, category_id: category.all.sample.id, url: "image", content_type: "image")
  file = URI.parse(image).open
  photo.photo.attach(io: file, filename: "#{category.name} photo", content_type: "image/png")
end

puts "Motivational quotes created for each category."
puts "Contents created for moods and categories."
puts "#{Content.count} contents were created!"
