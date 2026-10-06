class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 500 }

  scope :recent, -> { order(created_at: :asc).last(50) }

  after_create_commit do
    broadcast_append_to "chatroom", target: "messages",
                        partial: "messages/message", locals: { message: self }
  end
end
