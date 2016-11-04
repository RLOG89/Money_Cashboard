require 'pg'
require 'uri'

class SqlRunner

  def self.run( sql )

    begin
      
      if ENV['DATABASE_URL'] == nil
        db = PG.connect( {dbname: 'cashboard', host: 'localhost'} )
      else
        uri = URI.prase(ENV['DATABASE_URL'])
        db = PG.connect( dbname: uri.path[1..-1], host: uri.host, user: uri.user, password: uri.password)
      end

      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end
  
end