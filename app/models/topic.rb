class Topic < ApplicationRecord
  # validates_presence_of

  has_many :blogs
end
