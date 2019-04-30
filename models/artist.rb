require_relative('../db/sql_runner')
require_relative('../models/album.rb')

require('pry-byebug')

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def artist_name()
    return "#{@name}"
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    ) VALUES
    (
      $1
    )RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map {|album| Album.new(album)}
  end

  # def artists()
  #   sql = "SELECT albums.* FROM albums INNER JOIN artists a ON artist.album_id = albums.id WHERE artists.artist_id = $1;"
  #    values = [@id]
  #    result = SqlRunner.run(sql, values)
  #    return results.map {|artist| Artist.new(artist)}
  # end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    # artist = artist.new(result.first)
    artist = Artist.new(result)
    return artist
    # return Artist.new(result.first)
    binding.pry
  #   nil
   end

  def self.all()
    sql = "SELECT * FROM artists"
    all_artists = SqlRunner.run(sql)
    return self.map_items(all_artists)
  end

  def self.map_items(artist_data)
  result = artist_data.map{|artist| Artist.new(artist)}
  end
end
