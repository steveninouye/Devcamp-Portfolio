class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  has_many :technologies
   
  accepts_nested_attributes_for :technologies, reject_if: lambda {|attrs| attrs['name'].blank?}

  # this is from concerns directdory   /models/concerns/placeholder.rb
  include Placeholder

  # this can be written as
  # scope :angular, -> { where(subtitle: 'Angular') }
  def self.angular
    where(subtitle: 'Angular')
  end

  # works just like a instance method on portfolio
  # Portfolio.ruby_on_rails_portfolio_items    ==   Portfolio.all.where({subtitle: 'Ruby on Rails')})
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    # Placeholder is coming from the concern
    # concern gives this ability
    # self.main_image ||= "https://via.placeholder.com/600X400"
    self.main_image ||= Placeholder.image_generator(height:"600", width:"400")
    self.thumb_image ||= Placeholder.image_generator(height:"350", width:"200")
  end
end
