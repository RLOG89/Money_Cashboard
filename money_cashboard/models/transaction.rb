require_relative('../db/sql_runner')

class Transaction

  attr_reader( :id, :date, :merchant, :description, :amount )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @date = options['date']
    @merchant = options['merchant']
    @description = options['description']
    @amount = options['amount'].to_f
    @tag_id = options['tag_id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (date, merchant, description, amount, tag_id)
    VALUES ('#{@date}', '#{@merchant}', '#{@description}', #{@amount}, #{@tag_id})
    RETURNING *"
    transaction_data = SqlRunner.run( sql )
    @id = transaction_data.first['id'].to_i
  end

  def self.update( options )
    sql = "UPDATE transactions SET (date, merchant, description, amount, tag_id) 
    = ('#{options['date']}', '#{options['merchant']}', '#{options['description']}', #{options['amount']}, #{options['tag_id']})
    WHERE id = #{options['id']}"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM transacactions WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM transactions"
    return Transaction.map_items( sql )
  end

  def self.map_items( sql )
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end
end