class MessageSerializer < ActiveModel::Serializer
  attributes :chat_room_id, :content, :created_at, :user_id
end