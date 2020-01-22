require('pg')
require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :album_name
  attr_reader :id, :artist_id

  def initialize(options)
    @album_name = options['album_name']
    @id = options['id'].to_i if options['id']
    @artist_id = options["artist_id"].to_i
  end


  def save()
    sql = "INSERT INTO albums
    (album_name, artist_id) VALUES
    ($1, $2)
    RETURNING id"
    values = [@album_name, @artist_id]
    albums = SqlRunner.run(sql, values)
    @id =albums[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artists = results.map{|artist|Artist.new(artist)}
    return artists
  end


  def delete()
    sql = "DELETE FROM albums where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



  # def update()
  #   sql = "UPDATE albums SET (album_name) = ('These Days') WHERE (album_name) = ('Keep the Faith');"
  #   values = [@album_name, @id]
  #   results = SqlRunner.run(sql, values)
  #   albums = results.map{|album|Album.new(album)}
  #   return albums
  # end






end
