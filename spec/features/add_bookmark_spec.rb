require "capybara/rspec"
require_relative "../../app"

feature "adding bookmarks" do
    scenario "can add bookmark and see it displayed in bookmark list" do
        #connection = PG.connect('bookmark_manager_test')

        visit '/bookmarks'
        fill_in('website', with: 'http://www.google.com')
        click_on('Add Bookmark')
        expect(page).to have_content('http://www.google.com')
    end
end
