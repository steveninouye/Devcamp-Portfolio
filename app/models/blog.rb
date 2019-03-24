 class Blog < ApplicationRecord
  # gives value of draft as 0 and published as 1
  # db will have value 1 and 0 but we can alter status of blog using keys
  # e.g.  Blog.last.draft     or      Blog.first.pusblished
  enum status: { draft: 0, published: 1 }

  # grabs slug from url and maps it to "frinedly" method on Active Record
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic
end
