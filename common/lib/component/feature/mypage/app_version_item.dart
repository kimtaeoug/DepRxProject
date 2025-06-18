import 'package:core/utils/package_info_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:resource/resource_manager.dart';

class AppVersionItem extends StatelessWidget {
  final PackageInfoUtil packageInfoUtil;

  AppVersionItem({super.key, required this.packageInfoUtil});

  final TextStyle _textStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.labelAlternativeColor2);
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.only(top: 20, bottom: 27),
      child: Center(
        child: Text(
          'App version : ${packageInfoUtil.versionName}',
          style: _textStyle,
        ),
      ),
    );
  }
}
