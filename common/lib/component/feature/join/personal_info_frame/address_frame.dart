import 'package:common/component/feature/join/address_search_webview.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import '../../../common/dp_text_input.dart';
import '../../../common/dp_title.dart';

class AddressFrame extends StatefulWidget {
  final void Function(bool isForward, {bool noAnimation}) moveFunction;
  final bool isFromSummary;
  final Function(String) setAddressFunction;

  const AddressFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.setAddressFunction});

  @override
  State<StatefulWidget> createState() => _AddressFrame();
}

class _AddressFrame extends State<AddressFrame> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgLightGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DpTitle(title: 'userAddress_overview_title'.tr),
          const SizedBox(
            height: 6,
          ),
          _addressContainer()
        ],
      ),
    );
  }

  ///
  /// Address Container
  ///
  final TextEditingController _textEditingController = TextEditingController();

  Widget _addressContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () async {
          final dynamic value = await Get.to(() => AddressSearchWebView(
              setAddressFunction: widget.setAddressFunction));
          if (value == true) {
            widget.moveFunction.call(true, noAnimation: true);
          }
        },
        child: DpTextInput(
          controller: _textEditingController,
          onChanged: (value) {},
          enabled: false,
          hintText: 'userAddress_textfield_hint'.tr,
          prefixIcon: _searchIcon,
          prefixHeight: 24,
          containerBorderColor: DColors.lineNeutralColor2.withValues(alpha: 0.22),
        ),
      ),
    );
  }

  final Widget _searchIcon = Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Resource.icon('ic_search', width: 24, height: 24),
  );
}
