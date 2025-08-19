import '../models/message_model.dart';

class MessageRepository {
  List<MessageModel> getMessages() {
    return [
      MessageModel(
        type: "text",
        content: "Hey 👋",
        time: "10:30",
        isMe: false,
      ),
      MessageModel(
        type: "text",
        content: "Hi! How’s your day?",
        time: "10:31",
        isMe: true,
      ),
      MessageModel(
        type: "image",
        content: "https://th.bing.com/th/id/OIP.GOxWWwPy-60orP0PSlXLBQHaHa?w=195&h=195&c=7&r=0&o=7&pid=1.7&rm=3",
        time: "10:32",
        isMe: false,
      ),
      MessageModel(
        type: "text",
        content: "Wow 🔥 that looks amazing!",
        time: "10:33",
        isMe: true,
      ),
      MessageModel(
        type: "audio",
        content: "0:12",
        time: "10:34",
        isMe: false,
      ),
      MessageModel(
        type: "text",
        content: "😂😂",
        time: "10:35",
        isMe: true,
      ),
    ];
  }
}