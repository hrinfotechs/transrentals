import 'package:Transrentals/core/local/shared_pref/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_theme.dart';
import '../../routes/pages.dart';
import '../../routes/routes.dart';
import '../../translations/app_translations.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        title: 'Transrentals',
        initialRoute: (Get.find<SharedPreferenceHelper>().getIsFirstTime)
            ? Routes.onBoarding
            : (Get.find<SharedPreferenceHelper>().isLoggedIn)
                ? Routes.home
                : Routes.signUp,
        theme: themeData,
        defaultTransition: Transition.noTransition,
        getPages: AppPages.pages,
        translationsKeys: AppTranslation.translations,
        builder: EasyLoading.init(),
      ),
    );
  }
}
