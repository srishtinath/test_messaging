class MessageSerializer < ActiveModel::Serializer
  attributes :chat_room_id, :content, :created_at, :user_id
  # def user
  #   object.user do |user|
  #     ::UserSerializer.new(user).attributes
  #   end
  # end
end