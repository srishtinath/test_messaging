# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ChatRoom.delete_all
Message.delete_all
User.delete_all

chat1 = ChatRoom.create(name: "First one")
chat2 = ChatRoom.create(name: "Second one")
chat3 = ChatRoom.create(name: "Third one")
chat4 = ChatRoom.create(name: "Fourth one")
chat5 = ChatRoom.create(name: "Fifth one")

srishti = User.create(username: "srishti", password: "abc123")

Message.create(chat_room: chat1, content: "Hello!", user: srishti)
Message.create(chat_room: chat1, content: "Konnichiwa!", user: srishti)
Message.create(chat_room: chat1, content: "Good evening!", user: srishti)
Message.create(chat_room: chat1, content: "Sup!", user: srishti)
Message.create(chat_room: chat1, content: "Hot damn!", user: srishti)
Message.create(chat_room: chat1, content: "It's getting hot in here!", user: srishti)
Message.create(chat_room: chat1, content: "So take off all your clothes!", user: srishti)
