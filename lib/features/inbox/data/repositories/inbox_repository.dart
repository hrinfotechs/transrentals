import 'package:Transrentals/features/inbox/data/api/inbox_api.dart';

class InboxRepository {
  final InboxApi inboxApi;

  InboxRepository({required this.inboxApi});

// Future<User> getUserRequested() async {
//   try {
//     final rawUser = await homeApi.getUserApi();
//     return User.fromJson(rawUser);
//   } catch (e) {
//     log(e.toString());
//     rethrow;
//   }
// }
}
