require 'rails_helper'

RSpec.describe ShortUrl, type: :model do

  describe '#valid?' do     
    let(:valid_url) { 'https://www.google.com' }
    let(:code) { '123' }

    let(:code_params) do { code: code } end

    it "is not valid with a blank original_url" do 
      params = code_params.merge(original_url: '')
    	expect(ShortUrl.new(params).valid?).to eq false
    end

    it "is not valid when original_url is not a valid url " do
      params = code_params.merge(original_url: 'some random text')
    	expect(ShortUrl.new(params).valid?).to eq false
    end
    
    it "is valid when original_url a valid http url" do
      params = code_params.merge(original_url: 'http://www.google.com')
      expect(ShortUrl.new(params).valid?).to eq true
    end

    it "is valid when original_url a https valid url" do
      params = code_params.merge(original_url: 'https://www.google.com')
    	expect(ShortUrl.new(params).valid?).to eq true
    end

    it "is valid when original_url a valid url without top level domain name" do
      params = code_params.merge(original_url: 'https://google.com')
    	expect(ShortUrl.new(params).valid?).to eq true
    end
    
    it "is valid when original_url a valid url with parameters" do
      params = code_params.merge(original_url: 'https://google.com?search=brilyuhns')
      expect(ShortUrl.new(params).valid?).to eq true
    end

    it "is valid when original_url a valid url with parameters" do
      params = code_params.merge(original_url: 'https://google.com?search=brilyuhns')
      expect(ShortUrl.new(params).valid?).to eq true
    end

    it "is not valid when original_url is not http or https protocol" do
      params = code_params.merge(original_url: 'file://google.com?search=brilyuhns')
      expect(ShortUrl.new(params).valid?).to eq false
    end

    it "is not valid when original_url is relative url" do
      params = code_params.merge(original_url: 'file://google.com?search=brilyuhns')
      expect(ShortUrl.new(params).valid?).to eq false
    end

    it "is not valid if code is empty" do
      expect(ShortUrl.new(original_url: valid_url).valid?).to eq false
    end

    it "is valid when code is not empty" do
      expect(ShortUrl.new(original_url: valid_url, code: 'xxxx').valid?).to eq true
    end

    it "is not valid when code is already used" do
      create(:short_url, original_url: valid_url, code: 'xxxx')
      expect(ShortUrl.new(original_url: valid_url, code: 'xxxx').valid?).to eq false
    end
  end
end
