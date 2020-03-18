class Comment < ApplicationRecord
  validates :content, presence: {message: "Please enter your comment"}
  validates :content, uniqueness: { case_sensitive: false }
  belongs_to :article
  belongs_to :user
end
