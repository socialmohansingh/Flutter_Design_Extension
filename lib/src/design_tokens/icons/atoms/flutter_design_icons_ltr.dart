import 'package:flutter/widgets.dart';
import 'package:flutter_design_extension/src/design_tokens/icons/atoms/icon_font_base_interface.dart';
import 'package:flutter_design_extension/src/utils/flutter_design_constants.dart';

const String _kFontFam = 'ChardonnayIconsLTR';
const String _kFontPkg = FlutterDesignConstants.packageName;

IconData _getIconData(int codePoint) => IconData(
      codePoint,
      fontFamily: _kFontFam,
      fontPackage: _kFontPkg,
    );

class FlutterDesignIconsLTR implements IconFontBaseInterface {
  @override
  IconData add = _getIconData(0xe802);
  @override
  IconData add_circle = _getIconData(0xe800);
  @override
  IconData add_photo = _getIconData(0xe801);
  @override
  IconData arrow_back = _getIconData(0xe803);
  @override
  IconData arrow_collapse = _getIconData(0xe804);
  @override
  IconData arrow_downward = _getIconData(0xe805);
  @override
  IconData arrow_expand = _getIconData(0xe806);
  @override
  IconData arrow_forward = _getIconData(0xe807);
  @override
  IconData arrow_upward = _getIconData(0xe808);
  @override
  IconData check_circle = _getIconData(0xe809);
  @override
  IconData checkbox_indeterminate = _getIconData(0xe83d);
  @override
  IconData checkbox_selected = _getIconData(0xe83e);
  @override
  IconData checkbox_unselected = _getIconData(0xe83f);
  @override
  IconData chevron_down = _getIconData(0xe80a);
  @override
  IconData chevron_left = _getIconData(0xe80b);
  @override
  IconData chevron_right = _getIconData(0xe80c);
  @override
  IconData chevron_up = _getIconData(0xe80d);
  @override
  IconData close = _getIconData(0xe80e);
  @override
  IconData contact_chat = _getIconData(0xe80f);
  @override
  IconData contact_keyboard = _getIconData(0xe810);
  @override
  IconData contact_mail = _getIconData(0xe811);
  @override
  IconData contact_phone = _getIconData(0xe812);
  @override
  IconData date = _getIconData(0xe813);
  @override
  IconData delete = _getIconData(0xe814);
  @override
  IconData done = _getIconData(0xe816);
  @override
  IconData done_all = _getIconData(0xe815);
  @override
  IconData download = _getIconData(0xe817);
  @override
  IconData drag_indicator = _getIconData(0xe818);
  @override
  IconData edit = _getIconData(0xe819);
  @override
  IconData error_circle = _getIconData(0xe81a);
  @override
  IconData feedback_checking = _getIconData(0xe81b);
  @override
  IconData feedback_error = _getIconData(0xe81c);
  @override
  IconData feedback_information = _getIconData(0xe81d);
  @override
  IconData feedback_success = _getIconData(0xe81e);
  @override
  IconData feedback_warning = _getIconData(0xe81f);
  @override
  IconData filter = _getIconData(0xe820);
  @override
  IconData hamburger_menu = _getIconData(0xe821);
  @override
  IconData help_circle = _getIconData(0xe822);
  @override
  IconData home = _getIconData(0xe823);
  @override
  IconData inbox = _getIconData(0xe824);
  @override
  IconData info_circle = _getIconData(0xe825);
  @override
  IconData language = _getIconData(0xe826);
  @override
  IconData launch = _getIconData(0xe827);
  @override
  IconData loader = _getIconData(0xe828);
  @override
  IconData notifications = _getIconData(0xe829);
  @override
  IconData orders = _getIconData(0xe82a);
  @override
  IconData overflow = _getIconData(0xe82b);
  @override
  IconData radio_button_selected = _getIconData(0xe840);
  @override
  IconData radio_button_unselected = _getIconData(0xe841);
  @override
  IconData refresh = _getIconData(0xe82c);
  @override
  IconData remove = _getIconData(0xe82e);
  @override
  IconData remove_circle = _getIconData(0xe82d);
  @override
  IconData restaurant_menu = _getIconData(0xe82f);
  @override
  IconData search = _getIconData(0xe830);
  @override
  IconData share = _getIconData(0xe831);
  @override
  IconData star_empty = _getIconData(0xe832);
  @override
  IconData star_filled = _getIconData(0xe833);
  @override
  IconData support = _getIconData(0xe834);
  @override
  IconData time = _getIconData(0xe835);
  @override
  IconData trending = _getIconData(0xe836);
  @override
  IconData unfold_less = _getIconData(0xe837);
  @override
  IconData unfold_more = _getIconData(0xe838);
  @override
  IconData upload = _getIconData(0xe839);
  @override
  IconData visibility_off = _getIconData(0xe83b);
  @override
  IconData visibility_on = _getIconData(0xe83a);
  @override
  IconData warning_circle = _getIconData(0xe83c);
}
