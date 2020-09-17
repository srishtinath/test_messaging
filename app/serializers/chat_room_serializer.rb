class ChatRoomSerializer < ActiveModel::Serializer
  attributes :name, :messages
  attribute :users do |room|
    UserSerializer.new(room.users.uniq)
  end
end
