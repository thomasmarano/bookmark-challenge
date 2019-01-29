require "capybara/rspec"
require_relative "../../app"


feature 'Visiting bookmarks' do
    scenario 'visiting the bookmarks page' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

        connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
        connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
        connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.google.com');")

        visit '/'
        click_on('Bookmarks')
        expect(page).to have_content('https://www.google.com')
        expect(page).to have_content('http://www.makersacademy.com')
        expect(page).to have_content('http://www.destroyallsoftware.com')
    end
end
