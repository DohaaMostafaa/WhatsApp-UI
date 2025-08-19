class MessageModel {
  final String type;
  final String content;
  final String time;
  final bool isMe;

  MessageModel({
    required this.type,
    required this.content,
    required this.time,
    required this.isMe,
  });
}