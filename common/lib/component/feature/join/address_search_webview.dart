import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:resource/resource_manager.dart';
import 'package:api/api.dart';

class AddressSearchWebView extends StatefulWidget {
  final Function(String) setAddressFunction;

  const AddressSearchWebView({super.key, required this.setAddressFunction});

  @override
  State<StatefulWidget> createState() => _AddressSearchWebView();
}

class _AddressSearchWebView extends State<AddressSearchWebView> {
  bool _isLoading = true;
  final ScreenUtil _screenUtil = ScreenUtil();
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        "onComplete",
        onMessageReceived: _onMessageReceived,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: _onPageFinished,
        ),
      )
      ..loadRequest(_postcodePageUri())
      ..setBackgroundColor(DColors.white)
      ..reload();
  }

  @override
  void dispose() {
    _webViewController.clearCache();
    _webViewController.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          appBar: _isLoading
              ? AppBar(
            backgroundColor: DColors.white,
          )
              : _appBar(),
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Stack(
              children: [
                SizedBox(
                  width: _screenUtil.width,
                  height: _screenUtil.height,
                  child: WebViewWidget(
                    controller: _webViewController,
                  ),
                ),
                if (_isLoading)
                  SizedBox(
                    width: _screenUtil.width,
                    height: _screenUtil.height,
                    child: Center(
                      child: Padding(
                        padding:
                        EdgeInsets.only(bottom: _screenUtil.topPadding),
                        child: Resource.lottiAnimation('loading',
                            width: 120, boxFit: BoxFit.fitWidth),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ));
  }

  void _onPageFinished(String message) {
    setState(() {
      _isLoading = false;
    });
  }

  void _onMessageReceived(JavaScriptMessage message) {
    final model = DaumPostcodeModel.fromJson(jsonDecode(message.message));
    widget.setAddressFunction(model.address);
    Get.back(result: true);
  }

  Uri _postcodePageUri() =>
      Uri.https(
        "onehunnitconst.github.io",
        "/daum_postcode_view/pages/postcode.html",
      );

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: DColors.white,
      centerTitle: true,
      title: Text(
        'userSearchAddress_appBar_title'.tr,
        style: _titleStyle,
      ),
      leadingWidth: 38,
      leading: GestureDetector(
        onTap: () {
          Get.back(result: false);
          // widget.moveFunction.call(false);
          // Get.toNamed(Routes.signUpPersonalInfo, arguments: {'page': 2});
        },
        child: Container(
          padding: const EdgeInsets.only(left: 18, top: 14, bottom: 14),
          color: DColors.transparent,
          child: Resource.icon('ic_arrow_left_sharp',
              width: 24, height: 24, needSizedBox: true),
        ),
      ),
    );
  }

  final TextStyle _titleStyle = DpTextStyle.h6.style.copyWith(
      color: DColors.black, height: 1.445, fontWeight: FontWeight.w600);
}
