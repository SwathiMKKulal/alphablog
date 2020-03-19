class Comment < ApplicationRecord
  validates :comment, presence: { message: "field cant be blank! please enter your comment"}
  validates :comment, uniqueness: { case_sensitive: false }
  belongs_to :article
  belongs_to :user
end
