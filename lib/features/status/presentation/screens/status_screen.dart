import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart' show AppTheme;
import '../../data/models/channel_model.dart';
import '../../data/models/status_model.dart';
import '../../data/models/suggestion_model.dart';
import '../../data/repositories/status_repository.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = StatusRepository();

    final List<StatusModel> statuses = repository.getStatuses();
    final List<ChannelModel> channels = repository.getChannels();
    final List<SuggestionModel> suggestions = repository.getSuggestions();

    return Scaffold(
      appBar: AppBar(title: const Text('Updates')),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Text(
            "Status",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 12.h),

          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statuses.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundImage: AssetImage(AppAssets.profileImage),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: AppColors.accent,
                            radius: 10.r,
                            child: const Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Text("Add", style: TextStyle(fontSize: 12)),
                    ],
                  );
                }

                final user = statuses[index - 1];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.lightGrey,
                        radius: 30.r,
                        child: Text(
                          user.name[0],
                          style: AppTheme.lightTheme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(user.name, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 15.h),

          Text(
            "Channels",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),

          for (var channel in channels)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(backgroundColor: Colors.grey),
              title: Text(
                channel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(channel.subtitle),
              trailing: Text(
                channel.date,
                style: const TextStyle(fontSize: 12),
              ),
            ),

          SizedBox(height: 20.h),

          Text(
            "Find channels to follow",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 10.h),

          for (var s in suggestions)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                radius: 30.r,
                child: Text(
                  s.name.split(' ').first,
                  style: AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              title: Text(s.name),
              subtitle: Text('${s.followers} followers'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60.w, 28.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                ),
                onPressed: () {},
                child: Text(
                  "Follow",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )

            ),

          SizedBox(height: 70.h),
        ],
      ),
    );
  }
}
