require('pg')
# require_relative("../db/sql_runner")

class Artist

  attr_reader :name, :id

  def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
    end


  def save()
    sql = "INSERT INTO artist(name)
    VALUES ($1) RETURNING id"
    values = [@name]
    artist_details = SqlRunner.run(sql, values)
    @id = artist_details[0]["id"].to_i
  end

  def Artist.all()
    sql = "SELECT * FROM artist"
    artist = SqlRunner.run(sql)
return artist.map {|artist| Artist.new(artist)}
end

def Artist.all()
  sql = "SELECT * FROM artist"
  artist = SqlRunner.run(sql)
return artist.map {|artist| Artist.new(artist)}
end

def Album
sql = "SELECT * FROM albums
WHERE artist_id = $1"
values = [@id]
results = SqlRunner.run( sql, values )
album_data = results[0]
album = Album.new( album_data )
return album.map {|album| Album.new(album)}
end
end
