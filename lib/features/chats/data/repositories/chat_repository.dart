import '../models/chat_model.dart';

class ChatRepository {
  List<ChatModel> getChats() {
    return [
      ChatModel(
        name: "kawhar🤍",
        message: "✓ 😂😂",
        time: "9:59 pm",
        unread: 0,
        isFavourite: false,
        isGroup: false,
      ),
      ChatModel(
        name: "mama❤️",
        message: "ok",
        time: "9:50 pm",
        unread: 0,
        isFavourite: true,
        isGroup: false,
      ),
      ChatModel(
        name: "alaa",
        message: "🎤 0:04",
        time: "10:16 pm",
        unread: 4,
        isFavourite: false,
        isGroup: false,
      ),
      ChatModel(
        name: "+20 10 14848611 (You)",
        message: "🖼️ Photo",
        time: "10:02 pm",
        unread: 0,
        isFavourite: false,
        isGroup: false,
      ),
      ChatModel(
        name: "family❤️",
        message: "alaa: اه",
        time: "9:22 pm",
        unread: 0,
        isFavourite: false,
        isGroup: true,
      ),
      ChatModel(
        name: "Rody❤️",
        message: "Rody❤️ reacted ❤️ to \"allby\"",
        time: "9:22 pm",
        unread: 0,
        isFavourite: true,
        isGroup: false,
      ),
    ];
  }
}
