import '../api/booking_api.dart';

class BookingRepository {
  final BookingApi bookingApi;

  BookingRepository({required this.bookingApi});

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
