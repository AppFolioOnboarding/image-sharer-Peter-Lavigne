require 'uri'

class Image < ApplicationRecord
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  acts_as_taggable_on :tags
end
