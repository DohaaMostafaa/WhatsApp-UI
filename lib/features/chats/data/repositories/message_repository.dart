import 'package:whatsup/core/assets/app_assets.dart';

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
        content: AppAssets.profileImage,
        time: "10:32",
        isMe: false,
      ),
      MessageModel(
        type: "text",
        content: "Where are you?",
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