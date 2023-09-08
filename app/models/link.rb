# frozen_string_literal: true

class Link < ApplicationRecord
  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :short_url, uniqueness: true

  before_validation :generate_short_url_slug

  def click
    increment!(:clicked)
  end

  private

  def generate_short_url_slug
    self.short_url = SecureRandom.uuid[0..7]
  end
end
