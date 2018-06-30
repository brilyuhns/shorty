# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Welcome"
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Shorten URL'
    expect(page).to have_content 'URL to shorten'
  end

  scenario "shorten a url" do
    visit "/short_urls/new"

    fill_in "URL to shorten", :with => "http://www.google.com"
    click_button "Shorten"
    
    expect(page).to have_text("Short url was successfully created.")
  end
end
