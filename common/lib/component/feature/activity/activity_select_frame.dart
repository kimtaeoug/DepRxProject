import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';
import '../../common/dp_network_img.dart';
import '../../common/dp_title.dart';

class ActivitySelectFrame extends StatelessWidget {
  final ActivitySelectItemModel data;
  final int idx;
  final bool Function(int, int) containEmpty;
  final Function(int, int, Function()) selectBA;
  ActivitySelectFrame(
      {super.key,
      required this.data,
      required this.idx,
      required this.containEmpty,
      required this.selectBA});

  final String _titlePrefix = 'baSelect_overview_title'.tr;
  final ScreenUtil _screenUtil = ScreenUtil();
  final String _noti = 'baSelect_overview_subTitle'.tr;
  final TextStyle _notiStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelNeutralColor2);

  late final int _listLength = data.baList.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: DpTitle(
            title: '${data.weekOfDay}$_titlePrefix',
            strongTitle: 'baSelect_overview_titleStrong'.tr,
            strongTitleColor: DColors.primaryNormalColor,
            needPadding: true,
            subTitle: _noti,
            inputSubTitleStyle: _notiStyle,
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(data.baList.length, (idx) {
              BAModel model = data.baList[idx];
              return _item(idx, model);
            }),
          ),
        ))
      ],
    );
  }

  final TextStyle _titleStyle = DpTextStyle.b1.style;

  Widget _item(int index, BAModel data) {
    return Padding(
      padding: EdgeInsets.only(
          top: index == 0 ? 1 : 0,
          bottom: index == _listLength - 1 ? 12 : 12,
          left: 24,
          right: 24),
      child: GestureDetector(
        onTap: () {
          selectBA(idx, index, () {
            ToastHandler().show('baSelect_toast_error_overflow'.tr, isError: true);
          });
        },
        child: Container(
          width: _screenUtil.width,
          padding: _screenUtil.h16v12,
          decoration: BoxDecoration(
              color: containEmpty(idx, index)
                  ? DColors.bgBlueColor
                  : DColors.white,
              borderRadius: _screenUtil.radius20,
              border: Border.all(
                  color: containEmpty(idx, index)
                      ? DColors.primaryNormalColor
                      : DColors.white,
                  width: 2),
              boxShadow: _screenUtil.pressShadow()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: DPNetworkImage(
                    imgPath: data.imagePath, width: 50, height: 50),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                    data.contents,
                    style: _titleStyle.copyWith(
                        color: containEmpty(idx, index)
                            ? DColors.primaryNormalColor
                            : DColors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
