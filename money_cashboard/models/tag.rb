require_relative('../db/sql_runner')
require_relative('./transaction')
require('pry-byebug')
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

  def transactions

  end

  def total_spend
    sql = "SELECT SUM (transactions.amount), tags.name FROM transactions INNER JOIN tags ON transactions.tag_id = tags.id  WHERE tags.name = '#{@name}' GROUP BY tags.name;"
    result_hash = SqlRunner.run( sql ).first
    if (result_hash.nil?)
      return 0.0
    end
     return result_hash['sum'].to_f
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

  def self.map_items( sql )
    tags = SqlRunner.run( sql )
    result = tags.map{ |tag| Tag.new(tag) }
    return result
  end

  def self.map_item( sql )
    Tag.map_items(sql).first
  end

  def self.find( id )
    sql = "SELECT * FROM tags WHERE id = #{id}"
    return Tag.map_item( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end