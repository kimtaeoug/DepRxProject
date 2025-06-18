import 'package:common/common.dart';
import 'package:core/config/ga_parameter_list.dart';
import 'package:core/config/ga_value_list.dart';
import 'package:core/core.dart';
import 'package:core/handler/ga_lfie_cycle_handler.dart';
import 'package:core/utils/ga_util.dart';
import 'package:deprx/core/deprx_life_cycle_handler.dart';
import 'package:deprx/presentation/controllers/inspection/bdi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class BDISelectPage extends StatefulWidget {
  bool? isFinal = Get.arguments?['isFinal'] as bool?;

  BDISelectPage({super.key});

  @override
  State<StatefulWidget> createState() => _BDISelectPage();
}

class _BDISelectPage extends State<BDISelectPage> with WidgetsBindingObserver {
  final ScreenUtil _screenUtil = ScreenUtil();
  final String _title = 'inspectionSelect_overview_title'.tr;
  final String _subTitle = 'inspectionSelect_overview_subTitle'.tr;
  final BDIController _controller = Get.find();
  final TextStyle _subTitleStyle =
      DpTextStyle.b2.style.copyWith(color: DColors.labelAlternativeColor2);

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.bdiSelect);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // GAUtil.trackEvent(name: GAEvent.BDI_RESULT_SELECTION_VIEW, params: {
    //   GAParameter.SCREEN_NAME : Get.currentRoute
    // });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    GALifeCycleHandler(
        state: state,
        gaFunction: (value) {
          GAUtil.trackEvent(name: GAEventList.BDI_SELECTION_EXIT, params: {
            GAParameter.EXIT_REASON:
            value ? GAValue.BACKGROUND_EXIT : GAValue.INSTANT_EXIT
          });
        });
    DeprxLifeCycleHandler().process(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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
          resizeToAvoidBottomInset: false,
          backgroundColor: DColors.bgLightGray,
          body: SizedBox(
            width: _screenUtil.width,
            height: _screenUtil.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _bdiSelectAppBar(),
                    DpTitle(
                      title: _title,
                      subTitle: _subTitle,
                      needPadding: true,
                      inputSubTitleStyle: _subTitleStyle,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _item(),
                    const SizedBox(
                      height: 20,
                    ),
                    _item(isAuto: false)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DpTitle(
                      title: _title,
                      subTitle: _subTitle,
                      needPadding: true,
                      inputTitleStyle: DpTextStyle.h3.style
                          .copyWith(color: DColors.transparent),
                      inputSubTitleStyle:
                          _subTitleStyle.copyWith(color: DColors.transparent),
                    ),
                    SizedBox(
                      height: _screenUtil.topPadding + 52,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget _bdiSelectAppBar() {
    if (widget.isFinal == true) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: BackAppBar(
          needTopPadding: true,
          isDeprx: true,
        ),
      );
    } else {
      return SizedBox(
        height: _screenUtil.topPadding + 52,
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
              });
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
            });
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
