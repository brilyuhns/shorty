require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  it "is not valid with a blank original_url" do 
    expect(ShortUrl.new(original_url: '').valid?).to eq false
  end

  it "is not valid when original_url is not a valid url " do
    expect(ShortUrl.new(original_url: 'some random text').valid?).to eq false
  end
  
  it "is valid when original_url a valid url" do
    expect(ShortUrl.new(original_url: 'https://www.google.com').valid?).to eq true
  end

  it "is valid when original_url a valid url without top level domain name" do
    expect(ShortUrl.new(original_url: 'https://google.com').valid?).to eq true
  end
  
  it "is valid when original_url a valid url with parameters" do
    expect(ShortUrl.new(original_url: 'https://google.com?search=brilyuhns').valid?).to eq true
  end

  it "is valid when original_url a valid url with parameters" do
    expect(ShortUrl.new(original_url: 'https://google.com?search=brilyuhns').valid?).to eq true
  end
end
