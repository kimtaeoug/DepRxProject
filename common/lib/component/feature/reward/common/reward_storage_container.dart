import 'package:core/config/ga_parameter_list.dart';
import 'package:core/core.dart';
import 'package:core/utils/ga_util.dart';
import 'package:flutter/cupertino.dart';

import 'package:api/api.dart';
import 'package:flutter/rendering.dart';
import 'package:resource/resource_manager.dart';
import 'reward_storage_wrapper.dart';

class RewardStorageContainer extends StatefulWidget {
  final Map<int, List<RewardModel>> data;
  final String? type;

  RewardStorageContainer({super.key, required this.data, this.type});

  @override
  State<StatefulWidget> createState() => _RewardStorageContainer();
}

class _RewardStorageContainer extends State<RewardStorageContainer> {
  final ScreenUtil _screenUtil = ScreenUtil();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    if (widget.type != null) {
      GAUtil.trackEvent(
          name: GAEventList.REWARD_STORAGE_VIEW,
          params: {GAParameter.VIEW_TYPE: widget.type ?? ''});
    }
    super.initState();
    if (widget.type == '전체') {
      _scrollController.addListener(_scrollListener);
    }
  }

  @override
  void dispose() {
    if (widget.type == '전체') {
      _scrollController.removeListener(_scrollListener);
    }
    super.dispose();
  }

  void _scrollListener() {
    double max = _scrollController.position.maxScrollExtent;
    if (_scrollController.hasClients) {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        double value = _scrollController.offset / max;
        if (value == 75) {
          GAUtil.trackEvent(
              name: GAEventList.REWARD_STORAGE_SCROLL,
              params: {GAParameter.SCROLL_DEPTH: '75%'});
        } else if (value == 100) {
          GAUtil.trackEvent(
              name: GAEventList.REWARD_STORAGE_SCROLL,
              params: {GAParameter.SCROLL_DEPTH: '100%'});
        }
      }
    }
  }

  //max : scrollController.position.maxScrollExtent

  //    _scrollController.addListener(() {
  //       print('offset = ${_scrollController.offset}');
  //     });

  //position.userScrollDirection: 사용자가 변경하려고 하는 방향이다.

  @override
  Widget build(BuildContext context) {
    final List<int> keys = widget.data.keys.toList();
    return SizedBox(
      width: _screenUtil.width,
      child: SingleChildScrollView(
        controller: widget.type == '전체' ? _scrollController : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.data.length, (idx) {
            int week = keys[idx];
            List<RewardModel> list = widget.data[week] ?? [];
            if (list.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.only(bottom: 30, top: idx == 0 ? 28 : 0),
                child: RewardStorageWrapper(
                    week: week, dataList: list, isDeprx: widget.type != null),
              );
            } else {
              if (idx == 0) {
                return const SizedBox(
                  height: 28,
                );
              } else {
                return const SizedBox.shrink();
              }
            }
          }),
        ),
      ),
    );
  }
}
