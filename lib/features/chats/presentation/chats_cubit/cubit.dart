import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsup/features/chats/presentation/chats_cubit/states.dart';
import '../../data/models/chat_model.dart';
import '../../data/repositories/chat_repository.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatInitial());

  static ChatsCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  final ChatRepository repository = ChatRepository();

  void onItemTapped(int index) {
     selectedIndex = index;
     emit(ItemTappedState());
  }
  void loadChats() {
    final allChats = repository.getChats();
    emit(ChatsLoaded(chats: allChats, filteredChats: allChats, selectedTab: 0));
  }

  void selectTab(int tabIndex) {
    selectedIndex = tabIndex;
    final state = this.state as ChatsLoaded;
    final allChats = state.chats;
    late List<ChatModel> filtered;

    switch (tabIndex) {
      case 1:
        filtered = allChats.where((chat) => chat.unread > 0).toList();
        break;
      case 2:
        filtered = allChats.where((chat) => chat.isFavourite).toList();
        break;
      case 3:
        filtered = allChats.where((chat) => chat.isGroup).toList();
        break;
      default:
        filtered = allChats;
    }

    emit(ChatsLoaded(
      chats: allChats,
      filteredChats: filtered,
      selectedTab: tabIndex,
    ));
  }
}
