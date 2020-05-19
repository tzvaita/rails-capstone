class Thought < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  validates :author_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }
end
