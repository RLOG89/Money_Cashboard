require_relative('../db/sql_runner')

class Tag

  attr_reader( :id, :name, :colour)

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @name = options['name']
    @colour = options['colour']
  end

  def save
    sql = "INSERT INTO tags (name, colour)
    VALUES ('#{@name}', '#{@colour}')
    RETURNING *
      "
    tag_data = SqlRunner.run( sql )
    @id = tag_data.first['id'].to_i
  end

end