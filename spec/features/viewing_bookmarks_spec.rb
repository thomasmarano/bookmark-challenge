require "capybara/rspec"
require_relative "../../app"


feature 'Visiting bookmarks' do
    scenario 'visiting the bookmarks page' do
        connection = PG.connect(dbname: 'bookmark_manager_test')

        connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
        connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy All');")
        connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.google.com', 'Google');")

        visit '/'
        click_on('Bookmarks')
        expect(page).to have_content('Makers')
        expect(page).to have_content('Google')
        expect(page).to have_content('Destroy All')
    end
end
