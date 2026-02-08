import 'dart:async';
import 'dart:math';
import 'package:tingle/database/fake_data/user_fake_data.dart';
import 'package:tingle/page/message_page/model/fetch_message_user_model.dart';

class FetchMessageUserApi {
  static int startPagination = 0;
  static int limitPagination = 20;

  static Future<FetchMessageUserModel> callApi({
    required String uid,
    required String token,
    required String type, // all, online, unread
  }) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay

    startPagination += 1;

    final random = Random();
    final now = DateTime.now();
    FakeProfilesSet.sampleNames.shuffle();
    List<MessageData> generateDummyMessages(int count) {
      return List.generate(count, (index) {
        final userId = 'user_${startPagination}_${index + 1}';
        final messageId = 'msg_${startPagination}_${index + 1}';
        final senderId = 'sender_${random.nextInt(1000)}';
        final name = FakeProfilesSet.sampleNames[index];
        final userName = 'user${random.nextInt(10000)}';
        final profileImage = 'https://randomuser.me/api/portraits/men/${random.nextInt(90)}.jpg';

        return MessageData(
          id: messageId,
          chatTopicId: 'topic_${random.nextInt(5000)}',
          senderId: senderId,
          message: 'Hello! This is a dummy message ${index + 1}',
          unreadCount: random.nextInt(5),
          userId: userId,
          name: name,
          userName: userName,
          image: profileImage,
          isProfilePicBanned: random.nextBool(),
          isVerified: random.nextBool(),
          isFake: random.nextBool(),
          time: now.subtract(Duration(minutes: random.nextInt(1440))).toIso8601String(),
        );
      });
    }

    return FetchMessageUserModel(
      status: true,
      message: 'Dummy message users fetched successfully',
      data: generateDummyMessages(8 + random.nextInt(5)), // Always more than 7 users (8 to 12 users)
    );
  }
}
