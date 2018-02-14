require_relative('../db/sql_runner.rb')

class Album
  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1;"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    artist_hash = artists[0]
    return Artist.new(artist_hash)
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
    )
    VALUES
    (
        $1, $2, $3
    )
    RETURNING *;"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def Album.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end





end
