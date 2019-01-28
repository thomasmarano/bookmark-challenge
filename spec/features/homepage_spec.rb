require "capybara/rspec"
require_relative "../../app"

feature 'Viewing the index page' do
    scenario 'visiting the index page' do
        visit '/'
        expect(page).to have_content('Bookmark Manager')
    end
end
