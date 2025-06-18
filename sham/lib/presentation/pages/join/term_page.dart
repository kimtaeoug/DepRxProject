import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:common/common.dart';
import 'package:resource/resource_manager.dart';
import 'package:core/core.dart';
import 'package:api/api.dart';

import '../../controllers/join/join_controller.dart';

class TermPage extends StatefulWidget {
  final bool? isSocial = Get.arguments?['isSocial'] as bool?;

  TermPage({super.key});

  @override
  State<StatefulWidget> createState() => _TermPage();
}

class _TermPage extends State<TermPage> {
  final JoinController _controller = Get.find();
  final JsonService _jsonService = JsonService();
  final ScreenUtil _screenUtil = ScreenUtil();
  Map<TermType, TermModel> _termData = {};

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.terms, isDeprx: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.clearData();
      _setTermModelData();
    });
  }

  void _setTermModelData() async {
    Map<TermType, TermModel> result = {};
    for (TermType type in _termList) {
      result[type] = await TermTypeExtension.model(type, _jsonService);
    }
    setState(() {
      _termData = result;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
      backgroundColor: DColors.bgAlternativeColor,
      body: SizedBox(
        width: _screenUtil.width,
        height: _screenUtil.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackAppBar(
                    backFunction: () {
                      _controller.clearData(needConsentClear: true);
                      Get.back();
                    },
                  ),
                  DpTitle(
                    title: 'terms_overview_title'.tr,
                    subTitle: 'terms_overview_subTitle'.tr,
                  )
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                width: _screenUtil.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _termConsentContainer(),
                    const SizedBox(
                      height: 66,
                    ),
                    _btn(),
                    const SizedBox(
                      height: 53,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  final List<TermType> _termList = TermType.values;

  Widget _termConsentContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: DColors.lineAlternativeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _allConsentItem(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_termList.length, (idx) {
                TermType type = _termList[idx];
                return Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _consentItem(type,
                        isSelect: _controller.consentList[type.idx],
                        isNecessary: idx != _termList.length - 1),
                  );
                });
              }),
            ),
          )
        ],
      ),
    );
  }

  final TextStyle _allStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.labelNormalColor);

  Widget _allConsentItem() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          color: DColors.white),
      child: GestureDetector(
        onTap: () {
          _controller.clickConsentAll();
        },
        child: Container(
          width: _screenUtil.width,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: DColors.bgBlueColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              Obx(() {
                return Resource.icon(
                    'ic_check_round_${_controller.consentList.first == true ? 'enable' : 'disable'}',
                    width: 24,
                    height: 24);
              }),
              const SizedBox(
                width: 12,
              ),
              Text(
                'terms_checkBox_consentAllBtn'.tr,
                style: _allStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _labelStyle = DpTextStyle.b2.style
      .copyWith(color: DColors.labelNormalColor, fontSize: 14);
  final TextStyle _suffixStyle =
      DpTextStyle.detail2.style.copyWith(color: DColors.labelNeutralColor);

  Widget _consentItem(TermType type,
      {bool isSelect = false, bool isNecessary = true}) {
    return SizedBox(
      width: _screenUtil.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _controller.clickConsentItem(type.idx);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Resource.icon(
                    'ic_check_only_${isSelect ? 'enable' : 'disable'}',
                    width: 24,
                    height: 24),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  isNecessary
                      ? '${'terms_checkBox_condition_required'.tr} ${type.label}'
                      : '${'terms_checkBox_condition_optional'.tr} ${type.label}',
                  style: _labelStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              DPBottomSheet.showMyPageSheet(_termData[type]?.title ?? '', _termData[type]?.contents ?? '',
                  isPrivacyConsent: type == TermType.privacyConsent);
              },
            child: Text(
              'terms_checkBox_showTermsBtn'.tr,
              style: _suffixStyle,
            ),
          )
        ],
      ),
    );
  }

  Widget _btn() {
    return Obx(() {
      return DPbutton(
        text: 'common_ctaBtn_next'.tr,
        function: () {
          GAUtil.trackEvent(name: GAEventList.TERMS_SUBMIT, params: {
            GAParameter.ALL_CHECKED : _controller.consentList.first == true ? 'true' : 'false'
          }, isDeprx: false);
          if (_controller.termPassCondition()) {
            if (widget.isSocial == true) {
              Get.toNamed(Routes.signUpPersonalInfo,
                  arguments: {'isSocial': widget.isSocial});
            } else {
              Get.toNamed(Routes.signUpAccountId);
            }
          }
        },
        isEnabled: _controller.termPassCondition(),
      );
    });
  }
}
