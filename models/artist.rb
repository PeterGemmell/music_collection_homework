require('pg')
require_relative('../db/sql_runner.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']


  end

  def save()
    sql = "INSERT INTO artists
    (name) VALUES
    ($1)
    RETURNING id"
    values = [@name]
    artists = SqlRunner.run(sql, values)
    @id =artists[0]["id"].to_i
  end


  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def album()
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map{|album|Album.new(album)}
    return albums
  end



end
