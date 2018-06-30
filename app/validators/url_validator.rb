class UrlValidator < ActiveModel::EachValidator

  def self.valid_url?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.valid_url?(value)
      record.errors.add(attribute, "is not a valid URL")
    end
  end

end
