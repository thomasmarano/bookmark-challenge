require 'databaseconnection'
require 'database_helpers'


describe DatabaseConnection do

    describe '#setup' do
        it 'should respond to setup' do
            expect(DatabaseConnection).to respond_to(:setup).with(1).argument
        end

        it 'should connect to a database called bookmark_manager_test' do
            expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
            DatabaseConnection.setup('bookmark_manager_test')
        end

    end

    describe '#connection' do
        it 'should ensure connection to db is persistent' do
              connection = DatabaseConnection.setup('bookmark_manager_test')
              expect(DatabaseConnection.connection).to eq connection
        end
    end

    describe '#query' do
        it 'passes an SQL query to the correct database' do
            connection = DatabaseConnection.setup('bookmark_manager_test')
            expect(connection).to receive(:exec).with('SELECT * FROM bookmarks;')

            DatabaseConnection.query("SELECT * FROM bookmarks;")
        end
    end



end
