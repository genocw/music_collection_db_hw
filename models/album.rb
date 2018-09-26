require("pg")
require_relative("../db/sql_runner.rb")

class Album

  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "
      INSERT INTO albums (title, genre, artist_id)
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def artist()
    sql = "
      SELECT * FROM artists
      WHERE id = $1;
    "
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist = Artist.new(results[0])
    return artist
  end

end
