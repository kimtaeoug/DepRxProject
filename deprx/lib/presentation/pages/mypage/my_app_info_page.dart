import 'package:deprx/presentation/controllers/mypage/mypage_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

class MyAppInfoPage extends StatefulWidget {
  MyAppInfoPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppInfoPage();
}

class _MyAppInfoPage extends State<MyAppInfoPage> {
  final MyPageController controller = Get.find();
  final PackageInfoUtil packageInfoUtil = PackageInfoUtil();

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.appInfo);
    controller.getLicenseData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ScreenUtil _screenUtil = ScreenUtil();
  final List<AppInfoType> _dataList = AppInfoType.values;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: DColors.white,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Padding(
              padding: EdgeInsets.only(top: _screenUtil.topPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TitleAppBar(
                      title: 'common_appInfo'.tr,
                      needTopPadding: false,
                      isDeprx: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyPageItemContainer(
                        widgetList: List.generate(_dataList.length, (idx) {
                      AppInfoType type = _dataList[idx];
                      if (type == AppInfoType.version) {
                        return VersionItem(
                            title: type.label,
                            contents: 'appInfo_cell_version_description'.tr,
                            value: type.data);
                      } else if (type == AppInfoType.opensource) {
                        return MyPageItem(
                            title: type.label,
                            function: () {
                              Rx<TermModel> data = controller.licenseData;
                              DPBottomSheet.showMyPageSheet(
                                  data.value.title, data.value.contents);
                            });
                      } else if (type == AppInfoType.mNumber) {
                        return DomeInfoItem(
                            title: type.label, value: type.data);
                      } else {
                        return AppInfoItem(title: type.label, value: type.data);
                      }
                    })),
                    AppVersionItem(packageInfoUtil: packageInfoUtil),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
