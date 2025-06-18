import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/resource_manager.dart';

import 'package:core/core.dart';
import '../../../common/button/dp_button.dart';
import '../../../common/dp_title.dart';
import '../widgets/birth_picker.dart';
import '../widgets/gender_btn.dart';

class BirthDateFrame extends StatefulWidget {
  final Function(bool) moveFunction;
  final bool isFromSummary;
  final DateTime birth;
  final String gender;
  final bool modifyBirth;
  final DateTime standardDate;
  final Function(bool) setModifyBirth;
  final bool Function(bool, String) birthPassCondition;
  final Function(String, DateTime) setGenderBirth;
  final bool isDeprx;
  const BirthDateFrame(
      {super.key,
      required this.moveFunction,
      this.isFromSummary = false,
      required this.birth,
      required this.gender,
      required this.modifyBirth,
      required this.standardDate,
      required this.setGenderBirth,
      required this.setModifyBirth,
      required this.birthPassCondition,
      this.isDeprx = true});

  @override
  State<StatefulWidget> createState() => _BirthDateFrame();
}

class _BirthDateFrame extends State<BirthDateFrame> {
  // final JoinController _controller = Get.find();
  final ScreenUtil _screenUtil = ScreenUtil();
  bool _showCalendar = false;
  DateTime inputBirth = DateTime.now();
  String gender = '';

  @override
  void initState() {
    GAUtil.logScreen(screenName: GAScreenList.userBirthGender, isDeprx: widget.isDeprx);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.birth != widget.standardDate) {
        setState(() {
          inputBirth = widget.birth;
        });
      }
      if (widget.gender != '') {
        setState(() {
          gender = widget.gender;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey _birthContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenUtil.width,
      height: _screenUtil.height,
      color: DColors.bgLightGray,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DpTitle(title: 'userBirthGender_overview_title'.tr),
                    Column(
                      key: _birthContainerKey,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GenderBtn(
                                text: 'userBirthGender_selectionM_gender_male'.tr,
                                function: () {
                                  setState(() {
                                    gender = 'M';
                                  });
                                },
                                isSelect: gender == 'M',
                              ),
                              GenderBtn(
                                text: 'userBirthGender_selectionM_gender_female'.tr,
                                function: () {
                                  setState(() {
                                    gender = 'F';
                                  });
                                },
                                isSelect: gender == 'F',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        _birthContainer(),
                        const SizedBox(
                          height: 12,
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: _btn(),
                )
              ],
            ),
            _showCalendar ? _calendar() : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  final TextStyle _birthStyle = DpTextStyle.b2.style.copyWith(
    color: DColors.labelNeutralColor,
  );
  final TextStyle _selectedBirthStyle =
      DpTextStyle.b1.style.copyWith(color: DColors.primaryNormalColor);

  Widget _birthContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showCalendar = !_showCalendar;
        });
      },
      child: Container(
        width: _screenUtil.width,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: DColors.white,
            boxShadow: _screenUtil.emphasizeShadow()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _shownBirth(),
            Resource.icon('ic_calendar', width: 24, height: 24)
          ],
        ),
      ),
    );
  }

  Widget _shownBirth() {
    if (_didSelectDate) {
      return Text(
        TimeUtil.convertDateTo(inputBirth, 'yyyy${'activityMain_year'.tr} MM${'activityMain_month'.tr} dd${'activityMain_day'.tr}'),
        style: _selectedBirthStyle,
      );
    } else {
      if ((inputBirth != widget.standardDate) && widget.modifyBirth == true) {
        return Text(
          TimeUtil.convertDateTo(inputBirth, 'yyyy${'activityMain_year'.tr} MM${'activityMain_month'.tr} dd${'activityMain_day'.tr}'),
          style: _selectedBirthStyle,
        );
      } else {
        return Text(
          'userBirthGender_datePicker_title'.tr,
          style: _birthStyle,
        );
      }
    }
  }

  ///
  /// Calendar
  ///

  bool _didSelectDate = false;
  final DateTime now = DateTime.now();

  Widget _calendar() {
    return SizedBox(
      width: _screenUtil.width,
      height: _screenUtil.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                _showCalendar = false;
              });
            },
            child: Container(
              width: _screenUtil.width,
              color: DColors.transparent,
            ),
          )),
          BirthPicker(
            initialTime: widget.modifyBirth ? inputBirth : now,
            dateTime: inputBirth,
            onDateTimeChanged: (date) {
              if (_didSelectDate == false) {
                setState(() {
                  _didSelectDate = true;
                });
              }
              if (widget.modifyBirth == false) {
                widget.setModifyBirth(true);
                // _controller.modifyBirth.value = true;
              }
              setState(() {
                inputBirth = date;
              });
            },
            header: _calendarHeader(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                _showCalendar = false;
              });
            },
            child: Container(
              width: _screenUtil.width,
              color: DColors.transparent,
            ),
          )),
        ],
      ),
    );
  }

  final TextStyle _headerStyle =
      DpTextStyle.h6.style.copyWith(color: DColors.black);
  final TextStyle _confirmStyle =
      DpTextStyle.b5.style.copyWith(color: DColors.primaryNormalColor);

  Widget _calendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TimeUtil.convertDateTo(inputBirth, 'yyyy${'activityMain_year'.tr} MM${'activityMain_month'.tr}'),
              style: _headerStyle,
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _showCalendar = false;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: DColors.bgBlueColor),
            child: Text(
              'common_ctaBtn_confirm'.tr,
              style: _confirmStyle,
            ),
          ),
        )
      ],
    );
  }

  ///
  /// Button
  ///

  Widget _btn() {
    bool pass = widget.birthPassCondition(widget.modifyBirth, gender);
    return DPbutton(
      text: widget.isFromSummary ? 'common_edit'.tr : 'common_ctaBtn_next'.tr,
      function: () {
        if (pass) {
          widget.setGenderBirth(gender, inputBirth);
          if (widget.isFromSummary == true) {
            Get.back();
          } else {
            widget.moveFunction.call(true);
          }
        }
      },
      isEnabled: widget.birthPassCondition(widget.modifyBirth, gender),
    );
  }
}
