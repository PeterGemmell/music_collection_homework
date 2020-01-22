require("pry")
require_relative("./artist.rb")
require_relative("./album.rb")




artist1 = Artist.new({'name' => 'Metallica'})
artist1.save()

artist2 = Artist.new({'name' => 'Bon Jovi'})
artist2.save()

artist3 = Artist.new({'name' => 'Notorious B.I.G'})
artist3.save()




album1 = Album.new({'album_name' => 'Master of Puppets', 'artist_id' => artist1.id})
album1.save()

album2 = Album.new({'album_name' => 'Keep the Faith', 'artist_id' => artist2.id})
album2.save()

album3 = Album.new({'album_name' => 'Ready to Die', 'artist_id' => artist3.id})
album3.save()



binding.pry
nil
