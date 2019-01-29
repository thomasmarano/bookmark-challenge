require "capybara/rspec"
require_relative "../../app"

feature 'Visiting bookmarks' do
    scenario 'visiting the bookmarks page' do
        visit '/'
        click_on('Bookmarks')
        expect(page).to have_content('https://www.google.com')
        expect(page).to have_content('https://www.facebook.com')
        expect(page).to have_content('https://www.twitter.com')
    end
end
