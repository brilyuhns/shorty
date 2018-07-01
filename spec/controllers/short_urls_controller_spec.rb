require 'rails_helper'
require 'rspec-rails'

RSpec.describe ShortUrlsController, type: :controller do
  describe "GET #show" do
    let(:short_url_1) { create :short_url }
    let(:short_url_2) { create :short_url }
    let(:short_url_3) { create :short_url, original_url: 'https://fb.com' }

    it "short_url_1 should redirect to google.com" do
      get :show, params: { code: short_url_1.code }
      expect(response).to have_http_status(302)
      expect(response['Location']).to eq('https://www.google.com')
    end
    it "short_url_2 should redirect to google.com" do
      get :show, params: { code: short_url_2.code }
      expect(response).to have_http_status(302)
      expect(response['Location']).to eq('https://www.google.com')
    end
    it "short_url_3 should redirect to fb.com" do
      get :show, params: { code: short_url_3.code }
      expect(response).to have_http_status(302)
      expect(response['Location']).to eq('https://fb.com')
    end
    it "shows 404 for invalid id" do
      get :show, params: { code: '' }
      expect(response).to have_http_status(404)
    end    
  end

  describe "GET #new" do
    it "get new page" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    let(:params) { {short_url: {original_url: "https://www.google.com"}} }
    it "create a short_url" do
      post :create, params: params
      expect(response).to have_http_status(302)
      expect(flash[:notice]).to eq 'Short url was successfully created.'
    end
  end
end