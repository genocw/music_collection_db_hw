require("pry")
require_relative("models/album.rb")
require_relative("models/artist.rb")

artist1 = Artist.new({
  "name" => "Alexi Murdoch"
  })

artist2 = Artist.new({
  "name" => "Ben Howard"
  })

artist1.save()
artist2.save()

album1 = Album.new({
  "title"     =>  "Time Without Consequence",
  "genre"     =>  "Contemporary Folk",
  "artist_id" =>  artist1.id
  })

album2 = Album.new({
  "title"     =>  "Every Kingdom",
  "genre"     =>  "Indie Folk",
  "artist_id" =>  artist2.id
  })

album3 = Album.new({
  "title"     =>  "Noonday Dream",
  "genre"     =>  "Indie Folk",
  "artist_id" =>  artist2.id
  })

album1.save()
album2.save()
album3.save()
