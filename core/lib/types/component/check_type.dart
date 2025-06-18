
import 'package:resource/resource_constants.dart';

///
/// Check img type
///
enum CheckType { base, round, only, sharp }

extension CheckIcon on CheckType {
  static final String _defaultPath = '$ICON_PATH/ic_check';

  static String imgPath(
      {CheckType type = CheckType.base, bool isEnable = true}) {
    switch (type) {
      case CheckType.base:
        return '$_defaultPath.svg';
      case CheckType.round:
        if (isEnable) {
          return '${_defaultPath}_round_enable.svg';
        } else {
          return '${_defaultPath}_round_disable.svg';
        }
      case CheckType.only:
        if (isEnable) {
          return '${_defaultPath}_only_enable.svg';
        } else {
          return '${_defaultPath}_only_disable.svg';
        }
      case CheckType.sharp:
        return '${_defaultPath}_sharp.svg';
    }
  }
}
