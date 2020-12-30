# frozen_string_literal: true

module IndexablePhoto
  extend ActiveSupport::Concern
  include AliasedIndex

  included do
    settings ElasticSettings::COMMON do
      mappings dynamic: 'false' do
        indexes :bigram, analyzer: 'bigram_analyzer', type: 'text'
      end
    end
    attribute :taken_at, Date
    attribute :tags, String, mapping: ElasticSettings::TAG
    attribute :url, String, mapping: ElasticSettings::KEYWORD
    attribute :thumbnail_url, String, mapping: ElasticSettings::KEYWORD
    attribute :popularity, Integer, default: 0, mapping: { type: 'integer' }
    attribute :album, String, mapping: { type: 'keyword', index: true }
    #add spec
    attribute :type, String,
      default: -> (photo, _attr) { photo.class.name.underscore },
      mapping: ElasticSettings::KEYWORD

    validates :url, presence: true
    validates :thumbnail_url, presence: true
    validates :taken_at, presence: true
  end
end
