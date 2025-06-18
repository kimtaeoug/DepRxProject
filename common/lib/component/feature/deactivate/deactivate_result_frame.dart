import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

class DeactivateResultPwdFrame extends StatelessWidget {
  final String id;
  final Function() moveToLogin;
  final Function() moveToResetPwd;

  DeactivateResultPwdFrame(
      {super.key,
      required this.id,
      required this.moveToLogin,
      required this.moveToResetPwd});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _textStyle = DpTextStyle.h4.style
      .copyWith(color: DColors.black, fontWeight: FontWeight.w700, letterSpacing: -0.32);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: _screenUtil.width,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${'deactivation_overview_title'.tr}\n',
                        style: _textStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _screenUtil.width,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text:
                              'findIdComplete_overview_title_prefix'.tr,
                          style: _textStyle),
                      TextSpan(
                          text: id == '' ? '3894ufnj***' : _idMask(),
                          style: _textStyle.copyWith(
                              color: DColors.primaryNormalColor)),
                      TextSpan(
                          text: 'findIdComplete_overview_title_suffix'.tr,
                          style: _textStyle)
                    ])),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 41),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                DPbutton(text: 'deactivation_ctaBtn_yes'.tr, function: moveToLogin),
                const SizedBox(
                  height: 16,
                ),
                DPOutlinedButton(text: 'deactivation_ctaBtn_no'.tr, function: moveToResetPwd)
              ],
            ),
          )
        ],
      ),
    );
  }
  String _idMask(){
    List<String> splitted = id.split('');
    if(splitted.length > 3){
      return '${id.substring(0, splitted.length - 3)}***';
    }else{
      return id;
    }
  }
}
