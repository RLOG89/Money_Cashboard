require_relative('../db/sql_runner')

class Merchant

  attr_reader( :id, :name )

  def initialize( options )
    id = options['id'].to_i 
    @id = id if id != nil
    @name = options['name']
  end

end