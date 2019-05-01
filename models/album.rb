require_relative('../db/sql_runner')
require_relative('../models/artist.rb')

require ('pry')

class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def album_title()
    return "#{@title}"
  end

  def total()
    return @title + @quantity
  end

  def check_quantity()
    if quantity <= 3
      return "low"
    elsif quantity >= 7
      return "high"
    else
      return "mid"
    end
  end

  def save()
    sql = "INSERT INTO albums
    (
      title,
      quantity,
      artist_id
    ) VALUES
    (
      $1, $2 , $3
    ) RETURNING id"
    values = [@title, @quantity, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET
    (
      title,
      quantity,
      artist_id
    ) =
    (
      $1, $2, $3
    )WHERE id = $4"
    values = [@title, @quantity, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    list_artists = Artist.new(results)
    # binding.pry
    # nil
    return list_artists
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
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

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    albums = Album.new(result)
    return albums
  end

  def self.map_items(album_data)
    results = album_data.map {|album| Album.new(album)}
  end

end
