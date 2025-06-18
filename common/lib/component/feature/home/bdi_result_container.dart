import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:core/core.dart';
import 'package:resource/resource_manager.dart';

class BDIResultContainer extends StatelessWidget {
  final String name;
  final String finalReward;
  final bool isBetter;

  BDIResultContainer({super.key,
    required this.name,
    required this.finalReward,
    this.isBetter = true});

  final ScreenUtil _screenUtil = ScreenUtil();

  final String _title = 'main_reInspection_title'.tr;
  final TextStyle _titleStyle =
  DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);
  final TextStyle _subTitleStyle =
  DpTextStyle.b6.style.copyWith(color: DColors.labelNeutralColor2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: _screenUtil.width,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: DColors.bgBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _screenUtil.width,
              child: Text(
                _title,
                style: _titleStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: _screenUtil.width,
              padding: _screenUtil.h16v12,
              decoration: BoxDecoration(
                  borderRadius: _screenUtil.radius12,
                  color: DColors.white.withValues(alpha: 0.6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: _screenUtil.width,
                    child: Text(
                      isBetter ? _goodContents() : _sameBadContents,
                      style: _subTitleStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: _screenUtil.width,
                    child: Text(
                      'main_reInspection_bdiResultSuffix'.tr,
                      style: _subTitleStyle,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final Regex _regex = Regex();

  String _goodContents() {
    try{
      String result = finalReward;
      if (finalReward.contains('을(를)')) {
        List<String> splitted = finalReward.split('을(를)');
        result = splitted[0];
      } else if (finalReward.contains('를(을)')) {
        List<String> splitted = finalReward.split('를(을)');
        result = splitted[0];
      } else if (finalReward.contains('을')) {
        List<String> splitted = finalReward.split('을');
        result = splitted[0];
      } else if (finalReward.contains('를')) {
        List<String> splitted = finalReward.split('를');
        result = splitted[0];
      }
      if (_regex.checkAbsence(result.split('')[result.length - 1])) {
        result += '\'으';
      } else {
        result += '\'';
      }
      return '$name${'main_reInspection_bdiResultName'
          .tr}${'main_reInspection_bdiResultPositive_prefix'
          .tr} \'$result${'main_reInspection_bdiResultPositive_suffix'.tr}';
    }catch(e){
      return '';
    }
  }

  late final String _sameBadContents =
      '$name${'main_reInspection_bdiResultName'
      .tr}${'main_reInspection_bdiResultNegative'.tr}';
}
