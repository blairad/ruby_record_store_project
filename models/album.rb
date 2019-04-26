require_relative('../db/sql_runner')

require ('pry')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :stock

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @stock = options['stock'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      stock,
      artist_id
    ) VALUES
    (
      $1, $2 , $3
    ) RETURNING id"
    values = [@title, @stock, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET
    (
      title,
      stock,
      artist_id
    ) =
    (
      $1, $2, $3
    )WHERE id = $4"
    values = [@title, @stock, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    all_albums = SqlRunner.run(sql)
    return self.map_items(all_albums)
  end

  def self.map_items(album_data)
    results = album_data.map {|album| Album.new(album)}
  end

end
