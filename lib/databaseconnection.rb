require 'pg'


class DatabaseConnection

    def initiailize
        @database
    end

    def self.setup(dbname)
        @connection = PG.connect(dbname: dbname)
    end

    def self.connection
        @connection
    end

    def self.query(sql_string)
        result = @connection.exec(sql_string)
    end


end


# DatabaseConnection.query is a class method.
# It takes one parameter: an SQL query string.
# It should use the class instance variable from setup
# to execute that SQL query string on the correct database, via pg.
