class Comment < ApplicationRecord
  validates :content, presence: {message: "Please enter your comment"}
  belongs_to :article
  belongs_to :user
end
