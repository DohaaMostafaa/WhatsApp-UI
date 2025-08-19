import '../models/status_model.dart';
import '../models/channel_model.dart';
import '../models/suggestion_model.dart';

class StatusRepository {
  List<StatusModel> getStatuses() {
    return [
      StatusModel(
        name: 'mama',
      ),
      StatusModel(
        name: 'alaa',
      ),
      StatusModel(
        name: 'Kawthar',
      ),
      StatusModel(
        name: 'Rody',
      ),
    ];
  }

  List<ChannelModel> getChannels() {
    return [
      ChannelModel(
        title: 'Channel 1',
        subtitle: 'فرصة قوية ...',
        date: '16/8/25',
      ),
      ChannelModel(
        title: 'Channel 2',
        subtitle: 'الدرس الأخير ...',
        date: '14/8/25',
      ),
    ];
  }

  List<SuggestionModel> getSuggestions() {
    return [
      SuggestionModel(
        name: 'منبه الصلاة علي النبي',
        followers: '12K',
      ),
      SuggestionModel(
        name: 'القرآن الكريم 🤍',
        followers: '227K',
      ),
      SuggestionModel(
        name: 'Learn English | تعليم الإنجليزية',
        followers: '119K',
      ),
    ];
  }
}