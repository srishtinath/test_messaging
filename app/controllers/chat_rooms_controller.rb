class ChatRoomsController < ApplicationController
     def index
          rooms = ChatRoom.all
          render json: rooms
     end
   
     def create
          chat_room = ChatRoom.new(chat_room_params)
          if chat_room.save
               serialized_data = ActiveModelSerializers::Adapter::Json.new(
                    ChatRoomSerializer.new(chat_room)
               ).serializable_hash
               ActionCable.server.broadcast 'chat_rooms_channel', serialized_data
               head :ok
          else
               render json: {errors: game.errors.full_messages}, status: 422
          end
     end

     def show
          chat_room = ChatRoom.find(params[:id])
          render json: ChatRoomSerializer.new(chat_room)
     end
     
     private
     def chat_room_params
          params.require(:chat_room).permit(:name)
     end
end
