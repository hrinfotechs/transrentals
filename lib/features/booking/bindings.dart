import 'package:Transrentals/features/booking/controller.dart';
import 'package:Transrentals/features/booking/data/api/booking_api.dart';
import 'package:Transrentals/features/booking/data/repositories/booking_repository.dart';
import 'package:get/get.dart';

class BookingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingApi>(() => BookingApi(Get.find()));
    Get.lazyPut<BookingRepository>(
        () => BookingRepository(bookingApi: Get.find()));
    Get.lazyPut<BookingController>(() => BookingController());
  }
}
