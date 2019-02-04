require "capybara/rspec"
require_relative "../../app"

feature 'update bookmark' do
    scenario 'can update URL or Title of bookmark' do
        visit '/bookmarks/new'
        fill_in('website', with: 'http://www.google.com')
        fill_in('bookmark_name', with: 'Google')
        click_on('Add Bookmark')
        expect(page).to have_content('Google')
        click_on('Edit')
        fill_in('title', with: 'Facebook')
        click_on('Submit')
        expect(page).not_to have_content('Google')
        expect(page).to have_content('Facebook')
    end
end
