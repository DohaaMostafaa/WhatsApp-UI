import '../../data/models/chat_model.dart';

abstract class ChatsState {}

class ChatInitial extends ChatsState {}
class ItemTappedState extends ChatsState {}
class ChatsLoaded extends ChatsState {
  final List<ChatModel> chats;
  final List<ChatModel> filteredChats;
  final int selectedTab;

  ChatsLoaded({
    required this.chats,
    required this.filteredChats,
    required this.selectedTab,
  });
}