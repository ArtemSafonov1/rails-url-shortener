# frozen_string_literal: true

class Link < ApplicationRecord
  validates :original_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :short_url, uniqueness: true

  before_validation :generate_short_url_slug
  after_create :send_sms

  def click
    increment!(:clicked)
  end

  def full_short_url
    "http://localhost:3000/links/s/#{short_url}" # hardcoded url
  end

  private

  def generate_short_url_slug
    self.short_url = SecureRandom.uuid[0..7]
  end

  def send_sms
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    client.messages.create(
      body: "New URL was added:\n" \
            "Original URL: #{original_url}\n" \
            "Short URL: #{full_short_url}",
      from: ENV['TWILIO_ACCOUNT_NUMBER'],
      to: ENV['YOUR_PHONE_NUMBER']
    )
  rescue StandardError
    nil
  end
end
