require_relative('../db/sql_runner')

class Tag

  attr_reader( :id, :name, :colour )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @name = options['name']
    @colour = options['colour']
  end

  def save
    sql = "INSERT INTO tags (name, colour)
    VALUES ('#{@name}', '#{@colour}')
    RETURNING *"
    tag_data = SqlRunner.run( sql )
    @id = tag_data.first['id'].to_i
  end

  def self.update( options )
    sql = "UPDATE tags SET
    name = '#{options['name']}',
    colour = '#{options['colour']}'
    WHERE id = #{options['id']}"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM tags WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM tags"    
    return Tag.map_items( sql )
  end

end