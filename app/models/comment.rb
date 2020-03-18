class Comment < ApplicationRecord
  validates :content, presence: true
  validates :content, uniqueness: { case_sensitive: false }
  belongs_to :article
  belongs_to :user
end
