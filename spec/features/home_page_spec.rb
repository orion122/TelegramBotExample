require 'rails_helper'

RSpec.feature "Visiting the home page", type: :feature do
  scenario "The visitor should see a 'Select Chat'" do
    visit root_path
    expect(page).to have_text("Select Chat")
  end
end
