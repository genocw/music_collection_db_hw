require("pg")
require_relative("../db/sql_runner.rb")

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "
    INSERT INTO artists (name)
    VALUES ($1)
    RETURNING id;
    "
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def albums()
    sql = "
      SELECT * FROM albums
      WHERE artist_id = $1;
    "
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album_hash| Album.new(album_hash) }
    return albums
  end

  def self.all()
    sql = "
      SELECT * FROM artists;
    "
    results = SqlRunner.run(sql)
    artists = results.map { |artist_hash| Artist.new(artist_hash) }
    return artists
  end

end
