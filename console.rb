require("pry")
require_relative("db/sql_runner")
require_relative("models/artist")
require_relative("models/album")

artist1 = Artist.new({'name' => 'Amy Winehouse'})
artist2 = Artist.new({'name' => 'Sam Smith'})

artist1.save()
artist2.save()

album1 = Album.new({
  'title' => 'Back to black',
  'genre' => 'soul',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'The thrill of it',
  'genre' => 'pop',
  'artist_id' => artist2.id
  })

album1.save()
album2.save()


binding.pry
nil
