import 'package:Transrentals/features/booking/bindings.dart';
import 'package:Transrentals/features/booking/view/booking_page.dart';
import 'package:Transrentals/features/edit_profile/bindings.dart';
import 'package:Transrentals/features/edit_profile/view/edit_profile_page.dart';
import 'package:Transrentals/features/home/bindings.dart';
import 'package:Transrentals/features/home/view/home_page.dart';
import 'package:Transrentals/features/inbox/bindings.dart';
import 'package:Transrentals/features/inbox/view/inbox_page.dart';
import 'package:Transrentals/features/login/bindings.dart';
import 'package:Transrentals/features/login/view/login_page.dart';
import 'package:Transrentals/features/notifications/bindings.dart';
import 'package:Transrentals/features/notifications/view/notifications_page.dart';
import 'package:Transrentals/features/on_boarding/bindings.dart';
import 'package:Transrentals/features/on_boarding/view/on_boarding_page.dart';
import 'package:Transrentals/features/profile/bindings.dart';
import 'package:Transrentals/features/profile/view/profile_page.dart';
import 'package:Transrentals/features/sign_up/bindings.dart';
import 'package:Transrentals/features/sign_up/view/sign_up_page.dart';
import 'package:Transrentals/features/webview_without_login/bindings.dart';
import 'package:Transrentals/features/webview_without_login/view/webview_without_login.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routes.onBoarding,
      page: () => OnBoardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.webview_without_login,
      page: () => WebViewWithoutLoginPage(),
      binding: WebViewWithoutLoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.booking,
      page: () => BookingPage(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.inbox,
      page: () => InboxPage(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => NotificationsPage(),
      binding: NotificationsBinding(),
    ),
  ];
}
