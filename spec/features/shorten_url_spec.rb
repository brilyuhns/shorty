# Feature: Shorten URL
#   As a visitor
#   I want to visit a home page
#   So I can shorten a url
feature 'Shorten New URL' do

  # Scenario: Visit the short_urls/new
  #   When I visit the short_urls/new
  #   Then I see "URL to shorten"
  scenario "shorten a url" do
    visit "/short_urls/new"

    fill_in "URL to shorten", :with => "http://www.google.com"
    click_button "Shorten"
    
    expect(page).to have_text("Short url was successfully created.")
    expect(page).to have_content(
      "Shortened url: #{short_url(code: ShortUrl.last)}"
    )
  end
end
