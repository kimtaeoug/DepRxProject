import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

import '../../../controllers/inspection/bdi_controller.dart';

class BDISelectPage extends StatefulWidget{
  bool? isFinal = Get.arguments?['isFinal'] as bool?;

  BDISelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _BDISelectPage();
}

class _BDISelectPage extends State<BDISelectPage> {

  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'inspectionSelect_overview_title'.tr;
  final String _subTitle = 'inspectionSelect_overview_subTitle'.tr;
  final BDIController _controller = Get.find();
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);
  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.bdiSelect, isDeprx: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (value, child) {
          if (!value) {
            if (widget.isFinal == true) {
              Get.back();
            }
          }
        },
        child: Scaffold(
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _bdiSelectAppBar(),
                DpTitle(
                  title: _title,
                  subTitle: _subTitle,
                  needPadding: true,
                  inputSubTitleStyle: _subTitleStyle,
                ),
                const SizedBox(
                  height: 91,
                ),
                _item(),
                const SizedBox(
                  height: 20,
                ),
                _item(isAuto: false)
              ],
            ),
          ),
        ));
  }

  Widget _bdiSelectAppBar() {
    if (widget.isFinal == true) {
      return Padding(
        padding: EdgeInsets.only(top: _screenUtil.topPadding, bottom: 13),
        child: BackAppBar(),
      );
    } else {
      return SizedBox(
        height: _screenUtil.topPadding + 65,
      );
    }
  }

  final TextStyle _titleStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.labelNormalColor);

  Widget _item({bool isAuto = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          if (isAuto) {
            if(widget.isFinal != true){
              GAUtil.trackEvent(name: GAEventList.BDI_AUTO_WAIT_CLICK, params: {
                GAParameter.BUTTON_NAME : 'auto_input'
              }, isDeprx: false);
            }
            _controller.waitBDI(
                isFinal: widget.isFinal,
                finalFunction: widget.isFinal == true
                    ? () {
                        showFinalBdi();
                      }
                    : null);
          } else {
            GAUtil.trackEvent(name: GAEventList.BDI_MANUAL_CLICK, params: {
              GAParameter.BUTTON_NAME : 'direct_input'
            }, isDeprx: false);
            showDirectlyBDI();
          }
        },
        child: Container(
          width: _screenUtil.width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: DColors.white,
              border: Border.all(color: DColors.white),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: _screenUtil.blue10Shadow()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                isAuto
                    ? 'inspectionSelect_arrowCell_auto'.tr
                    : 'inspectionSelect_arrowCell_direct'.tr,
                style: _titleStyle,
              ),
              Resource.icon('ic_arrow_right_small_blue',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                      DColors.labelNormalColor, BlendMode.srcIn))
            ],
          ),
        ),
      ),
    );
  }

  final DPDialog _dialog = DPDialog();
  final String _dialogTitle = 'inspectionDirect_dialog_title'.tr;
  final String _dialogSubTitle = 'inspectionDirect_dialog_subtitle'.tr;

  void showDirectlyBDI() {
    _dialog.showTitleWithSubtitleWithOneButton(_dialogTitle, _dialogSubTitle,
        () {
      Get.back();
    });
  }

  final String _bdiFinalTitle = 'bdiRequestDialog_title'.tr;
  final String _bdiFinalContents = 'bdiRequestDialog_subTitle'.tr;

  void showFinalBdi() {
    _dialog.showTitleWithSubtitleWithOneButton(
        _bdiFinalTitle, _bdiFinalContents, () {
      Get.back();
    });
  }
}
