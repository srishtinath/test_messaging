class ChatRoomSerializer < ActiveModel::Serializer
  attributes :name, :messages, :users
  
  def users
    object.users.uniq.map do |user|
      ::UserSerializer.new(user).attributes
    end
  end
end
