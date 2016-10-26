require_relative('../db/sql_runner')
require_relative('./transaction')

class Merchant

  attr_reader( :id, :name )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @name = options['name']
  end

  def save()
    name = @name.gsub("'", "''")
    sql = "INSERT INTO merchants (name)
    VALUES ('#{name}')
    RETURNING *"
    merchant_data = SqlRunner.run( sql )
    @id = merchant_data.first['id'].to_i
  end

  def transactions()
    sql = "SELECT * FROM transactions INNER JOIN merchants ON transactions.merchant_id = merchants.id WHERE merchants.id =#{@id}"
    Transaction.map_items( sql )
  end

  def self.update( options )
    name = (options["name"]).gsub("'", "''")
    sql = "UPDATE merchants SET
    name = '#{name}'
    WHERE id = #{options['id']}"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM merchants WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM merchants"    
    return Merchant.map_items( sql )
  end

  def self.map_items( sql )
    merchants = SqlRunner.run( sql )
    result = merchants.map{ |merchant| Merchant.new(merchant) }
    return result
  end

  def self.map_item( sql )
    Merchant.map_items(sql).first
  end

  def self.find( id )
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_item( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end
end