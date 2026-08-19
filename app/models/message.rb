# A single guestbook entry. Visitors may sign anonymously (name optional),
# but the message itself is required and kept short so the wall reads fast.
class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 500 }
  validates :name, length: { maximum: 60 }, allow_blank: true

  scope :wall, -> { order(created_at: :desc) }
end
