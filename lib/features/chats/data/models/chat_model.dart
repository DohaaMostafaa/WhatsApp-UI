class ChatModel {
  final String name;
  final String message;
  final String time;
  final int unread;
  final bool isFavourite;
  final bool isGroup;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.unread,
    required this.isFavourite,
    required this.isGroup,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      name: map['name'],
      message: map['message'],
      time: map['time'],
      unread: map['unread'],
      isFavourite: map['isFavourite'],
      isGroup: map['isGroup'],
    );
  }
}