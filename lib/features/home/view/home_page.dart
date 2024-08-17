import 'package:Transrentals/features/home/controller.dart';
import 'package:Transrentals/global_widgets/app_bar/common_app_bar.dart';
import 'package:Transrentals/global_widgets/bottom_navigation/after_login_bottom_navigation.dart';
import 'package:Transrentals/global_widgets/drawer/after_login_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar:
          getCommonAppBarForWebViewRefreshOptions(controller.scaffoldKey, () {
        controller.loadWebView();
      }),
      endDrawer: AfterLoginDrawer(),
      body: WebViewWidget(
        controller: controller.controller,
      ),
      bottomNavigationBar: AfterLoginBottomNavigation(
        selectedIndex: 0,
      ),
    );
  }
}
