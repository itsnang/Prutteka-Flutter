import 'package:prutteka_flutter/constants/text_size.dart';

enum TextSizeEnum { tiny, caption, body, subtitle, title, headline }

extension TextExtension on TextSizeEnum {
  double get value {
    switch (this) {
      case TextSizeEnum.tiny:
        return TextSize.TEXT_SIZE_TINY;
      case TextSizeEnum.caption:
        return TextSize.TEXT_SIZE_CAPTION;
      case TextSizeEnum.body:
        return TextSize.TEXT_SIZE_BODY;
      case TextSizeEnum.subtitle:
        return TextSize.TEXT_SIZE_SUBTITLE;
      case TextSizeEnum.title:
        return TextSize.TEXT_SIZE_TITLE;
      default:
        return TextSize.TEXT_SIZE_BODY;
    }
  }
}
