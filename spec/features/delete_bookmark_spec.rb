require "capybara/rspec"
require_relative "../../app"

feature 'delete bookmark' do
    scenario 'can delete a bookmark' do
        visit '/bookmarks/new'
        fill_in('website', with: 'http://www.google.com')
        fill_in('bookmark_name', with: 'Google')
        click_on('Add Bookmark')
        click_on('Delete')
        expect(page).not_to have_content('Google')
    end
end
