require 'rails_helper'

RSpec.describe ShortUrl, type: :model do

  describe '#valid?' do     
    let(:valid_url) { 'https://www.google.com' }
    let(:code) { '123' }

    let(:code_params) do { code: code } end

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
