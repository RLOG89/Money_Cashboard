require_relative('../db/sql_runner')

class Transaction

  attr_reader( :id, :date, :merchant, :description, :amount )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @date = options['date']
    @merchant = options['merchant']
    @description = options['description']
    @amount = options['amonut'].to_f
  end

  def save
    
  end
end