require('date')
require_relative('../db/sql_runner')

class Transaction

  attr_reader( :id, :date, :merchant_id, :amount, :tag_id )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @date = options['date']
    @merchant_id = options['merchant_id'].to_i
    @amount = options['amount'].to_f
    @tag_id = options['tag_id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (date, merchant_id, amount, tag_id)
    VALUES ('#{@date}', #{@merchant_id}, #{@amount}, #{@tag_id})
    RETURNING *"
    transaction_data = SqlRunner.run( sql )
    @id = transaction_data.first['id'].to_i
  end

  def tag
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    return Tag.map_item( sql )
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    return Merchant.map_item( sql )
  end

  def string_to_time( string )
    string_parts = string.split("-")
    year = string_parts[0]
    month = string_parts[1]
    day = string_parts[2]
    return Time.new(year, month, day)
  end

  def in_date_range?( start_date, end_date )
    transaction_date = string_to_time( @date )
    start_date = string_to_time( start_date )
    end_date = string_to_time( end_date )
    transaction_date.between?(start_date, end_date)
  end

  def self.update( options )
    sql = "UPDATE transactions SET (date, merchant_id, amount, tag_id) 
    = ('#{options['date']}', #{options['merchant_id']}, #{options['amount']}, #{options['tag_id']})
    WHERE id = #{options['id']}"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM transactions WHERE id = #{id}"
    SqlRunner.run( sql )
  end

  def self.all( query= "" )
    query1 = query.to_f
    query2 = query.to_s
    query3 = query.to_s
    sql = "SELECT * FROM transactions" 
    sql = sql + " WHERE amount ='#{query1}'" unless (query1 < 1.00)
    # sql = sql + " WHERE date BETWEEN '#{query2}' AND '#{query3}' " 
    return Transaction.map_items( sql )
  end

  def self.map_items( sql )
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

  def self.map_item( sql )
    Transaction.map_items( sql ).first
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item( sql )
  end

  def self.total_spend
    total = 0
    all_transactions = Transaction.all
    for transaction in all_transactions
      amount = transaction.amount
      total += amount
    end
    return sprintf('%.2f', total)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

end