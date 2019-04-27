require_relative('../db/sql_runner')

require('pry')

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
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

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    # artist = artist.new(result.first)
    return Artist.new(result.first)
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
