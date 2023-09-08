# frozen_string_literal: true

class Link < ApplicationRecord
  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(['http','https'])
  validates :short_url, uniqueness: true

  before_validation :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.uuid[0..7]
  end

  def click
    self.increment!(:clicked)
  end
end
