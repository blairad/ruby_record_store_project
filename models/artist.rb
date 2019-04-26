require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initalize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
      )
    (
      values
      )
    (
      $1
      )
    RETURNING id"
    values = [@name]
    result = SQLRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all(
    sql = "SELECT * FROM artists"
    all_albums = SQLRunner.run(sql)
    return self.map(all_albums)
  end

  def self.map_items(artist_data)
  result = artist_data.map{|artist| Artist.new(artist)}
  end
