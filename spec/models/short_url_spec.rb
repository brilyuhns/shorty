require 'rails_helper'

RSpec.describe ShortUrl, type: :model do

  let(:valid_url) { 'https://www.google.com' }
  let(:code) { '123' }

  let(:code_params) do { code: code } end

  describe '#valid?' do 
    shared_examples 'short_url is invalid for url' do |original_url|
      it 'returns false if original url is #{original_url}' do
        params = code_params.merge(original_url: original_url)
        expect(ShortUrl.new(params).valid?).to eq false
      end
    end

    shared_examples 'short_url is valid for url' do |original_url|
      it 'returns true if original url is #{original_url}' do
        params = code_params.merge(original_url: original_url)
        expect(ShortUrl.new(params).valid?).to eq true
      end
    end

    it_behaves_like "short_url is invalid for url", ''
    it_behaves_like "short_url is invalid for url", 'some random text'
    it_behaves_like "short_url is invalid for url", 'file://google.com?search=brilyuhns'
    it_behaves_like "short_url is invalid for url", '/something/google.com?search=brilyuhns'
    it_behaves_like "short_url is valid for url", 'http://www.google.com'
    it_behaves_like "short_url is valid for url", 'https://www.google.com'
    it_behaves_like "short_url is valid for url", 'https://google.com'
    it_behaves_like "short_url is valid for url", 'https://google.com?search=brilyuhns'

    it "is not valid when code is already used" do
      create(:short_url, original_url: valid_url, code: 'xxxx')
      expect(ShortUrl.new(original_url: valid_url, code: 'xxxx').valid?).to eq false
    end
  end

  describe '#create' do
    it "assigns a code if code is empty" do
      short_url = ShortUrl.create!(original_url: valid_url)
      expect(short_url.code).not_to be_nil
      expect(short_url.code).to satisfy { |val| val.is_a?(String) && val.size >= 1 }
    end

    it "returns true when code is not empty" do
      short_url = ShortUrl.create(original_url: valid_url, code: 'XXX')
      expect(ShortUrl.last).to eq(short_url)
    end    
  end
end
