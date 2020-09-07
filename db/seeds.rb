# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chat1 = ChatRoom.create(name: "First one")
chat2 = ChatRoom.create(name: "Second one")
chat3 = ChatRoom.create(name: "Third one")
chat4 = ChatRoom.create(name: "Fourth one")
chat5 = ChatRoom.create(name: "Fifth one")

Message.create(chat_room: chat1, content: "Hello!")
Message.create(chat_room: chat1, content: "Konnichiwa!")
Message.create(chat_room: chat1, content: "Good evening!")
Message.create(chat_room: chat1, content: "Sup!")
Message.create(chat_room: chat1, content: "Hot damn!")
Message.create(chat_room: chat1, content: "It's getting hot in here!")
Message.create(chat_room: chat1, content: "So take off all your clothes!")