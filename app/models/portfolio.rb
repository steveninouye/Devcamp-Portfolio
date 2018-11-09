class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  cope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://via.placeholder.com/640x400"
    self.thumb_image ||= "https://via.placeholder.com/350X200"
  end
end
