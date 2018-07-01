class AddCodeToShortUrls < ActiveRecord::Migration[5.2]
  def up
    add_column :short_urls, :code, :string, unique: true
    ShortUrl.all.each do |short_url| 
      loop do
        short_url.code = SecureRandom.urlsafe_base64(8)
        break unless ShortUrl.where(code: short_url.code).exists?
      end
      short_url.save!
    end
    change_column :short_urls, :code, :string, unique: true, null: false
    add_index :short_urls, :code
  end

  def down
    remove_index :short_urls, :code
    remove_column :short_urls, :code
  end
end
