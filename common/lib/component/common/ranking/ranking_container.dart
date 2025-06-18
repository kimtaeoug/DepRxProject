import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'ranking_item.dart';
import 'package:api/api.dart';

class RankingContainer extends StatelessWidget {
  final RankingModel model;
  final Function(String activityName, int rank)? gaFunction;

  RankingContainer({super.key, required this.model, this.gaFunction});

  final ScreenUtil _screenUtil = ScreenUtil();
  final TextStyle _titleStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.palletPurpleColor);
  final String _title = 'common_ranking_title'.tr;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
          boxShadow: _screenUtil.blue10Shadow(),
          color: DColors.palettePurple50,
          borderRadius: _screenUtil.radius20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _title,
            style: _titleStyle,
          ),
          _banner(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(model.rankingList.length, (idx) {
              RankingItemModel data = model.rankingList[idx];
              return Padding(
                padding: EdgeInsets.only(
                    bottom: idx != model.rankingList.length - 1 ? 12 : 0),
                child: GestureDetector(
                  onTap: (){
                    if(gaFunction != null){
                      gaFunction?.call(data.contents, idx+1);
                    }
                  },
                  child: RankingItem(
                      idx: idx + 1,
                      text: data.contents,
                      beforeGrade: RankingGradeExtension.grade(data.beforeValue),
                      afterGrade: RankingGradeExtension.grade(data.afterValue)),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  final String _bannerContents = 'common_ranking_banner'.tr;
  final String _bannerDetailContents =
      '${'common_ranking_negative_banner_prefix'.tr} 3${'common_ranking_negative_banner_suffix'.tr}';
  final TextStyle _bannerContentsStyle =
      DpTextStyle.detail1.style.copyWith(color: DColors.labelNeutralColor2);

  Widget _banner() {
    return Container(
      width: _screenUtil.width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          borderRadius: _screenUtil.radius8,
          color: DColors.white.withValues(alpha: 0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Resource.icon('ic_noti',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                  DColors.palletPurple400, BlendMode.srcIn)),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            model.isWorse ? _bannerDetailContents : _bannerContents,
            style: _bannerContentsStyle,
          ))
        ],
      ),
    );
  }
}
