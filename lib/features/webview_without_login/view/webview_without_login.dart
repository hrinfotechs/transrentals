import 'package:Transrentals/core/constants/colors.dart';
import 'package:Transrentals/global_widgets/app_bar/common_app_bar.dart';
import 'package:Transrentals/global_widgets/bottom_navigation/without_login_bottom_navigation.dart';
import 'package:Transrentals/global_widgets/drawer/without_login_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWithoutLoginPage extends StatelessWidget {
  String url = '';
  WebViewController? controller;

  WebViewWithoutLoginPage({Key? key}) {
    url = (Get.arguments ?? '').toString();
    EasyLoading.show(
      dismissOnTap: false,
    );
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              EasyLoading.dismiss(animation: true);
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
        ),
      )
      ..loadRequest(Uri.parse(url));
    controller?.setBackgroundColor(AppColors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBg,
      appBar: getCommonAppBar(),
      drawer: WithoutLoginDrawer(isFromWebViewPage: true),
      body: WebViewWidget(controller: controller!),
      extendBody: false,
      extendBodyBehindAppBar: false,
      bottomNavigationBar:
          WithoutLoginBottomNavigation(isFromWebViewPage: true),
    );
  }
}
