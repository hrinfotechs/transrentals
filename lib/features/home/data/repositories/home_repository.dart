import '../api/home_api.dart';

class HomeRepository {
  final HomeApi homeApi;

  HomeRepository({required this.homeApi});

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
