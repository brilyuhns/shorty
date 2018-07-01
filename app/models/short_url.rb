class ShortUrl < ApplicationRecord
  validates :original_url, presence: true
  validates :original_url, url: true
  validates :code, presence: true
  validates :code, uniqueness: true
end
