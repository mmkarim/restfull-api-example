class InformationSerializer < ActiveModel::Serializer
  attributes :url, :content

  class << self
    def get_content url
      begin
        page = Nokogiri::HTML open(url)

        page.css("h1", "h2", "h3").map do |tag_content|
          tag_content.text
        end
      rescue => e
        Rails.logger.error e.message
        return []
      end
    end
  end
end
