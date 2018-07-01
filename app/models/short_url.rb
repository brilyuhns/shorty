class ShortUrl < ApplicationRecord
  before_validation :assign_code, if: Proc.new { |short_url| short_url.code.nil? }
  validates :original_url, presence: true
  validates :original_url, url: true
  validates :code, presence: true
  validates :code, uniqueness: true

  def assign_code
    loop do
      self.code = SecureRandom.urlsafe_base64(8)
      break unless ShortUrl.where(code: self.code).exists?
    end
  end
end
