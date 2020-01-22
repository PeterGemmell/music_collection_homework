require('pg')

class SqlRunner

  def self.run(sql, values = [])

    begin
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare("query", sql) # setting or preparing the statement.
      result = db.exec_prepared("query", values) # executing the prepared statement.
    ensure
      db.close() if db != nil #ensure that no matter what happens, the database gets closed.
    end
    return result
  end

end
