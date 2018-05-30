require('pg')
# require_relative("../db/sql_runner")


class Album

  attr_reader :title, :genre, :artist_id

  def initialize(options)
      @title = options['title']
      @genre = options['genre']
      @artist_id = options['artist_id'].to_i
    end

    def save()
    sql = "INSERT INTO album
    (
      title,
      genre,
      artist_id
      ) VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@title, @genre, @artist_id]
      @id = SqlRunner.run(sql,values)[0]["id"].to_i
    end

    def Album.all()
      sql = "SELECT * FROM album"
      album = SqlRunner.run(sql)
  return album.map {|album| Album.new(album)}
  end

  def Find_Artist
  sql = "SELECT * FROM album
  WHERE artist_id = $1"
  values = [@artist_id]
  results = SqlRunner.run( sql, values )
  artist_data = results[0]
  artist = Artist.new( artist_data )
  return artist
end
end
