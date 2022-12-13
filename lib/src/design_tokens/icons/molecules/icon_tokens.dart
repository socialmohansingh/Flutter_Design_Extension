import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/icons/atoms/flutter_design_icons_ltr.dart';
import 'package:flutter_design_extension/src/design_tokens/icons/atoms/flutter_design_icons_rtl.dart';
import 'package:flutter_design_extension/src/design_tokens/icons/atoms/icon_font_base_interface.dart';

class IconTokens implements IconFontBaseInterface {
  late final IconFontBaseInterface _baseIconClass;

  IconTokens({required TextDirection textDirection})
      : _baseIconClass = textDirection == TextDirection.ltr
            ? FlutterDesignIconsLTR()
            : FlutterDesignIconsRTL();

  @override
  late IconData add = _baseIconClass.add;
  @override
  late IconData add_circle = _baseIconClass.add_circle;
  @override
  late IconData add_photo = _baseIconClass.add_photo;
  @override
  late IconData arrow_back = _baseIconClass.arrow_back;
  @override
  late IconData arrow_collapse = _baseIconClass.arrow_collapse;
  @override
  late IconData arrow_downward = _baseIconClass.arrow_downward;
  @override
  late IconData arrow_expand = _baseIconClass.arrow_expand;
  @override
  late IconData arrow_forward = _baseIconClass.arrow_forward;
  @override
  late IconData arrow_upward = _baseIconClass.arrow_upward;
  @override
  late IconData check_circle = _baseIconClass.check_circle;
  @override
  late IconData checkbox_indeterminate = _baseIconClass.checkbox_indeterminate;
  @override
  late IconData checkbox_selected = _baseIconClass.checkbox_selected;
  @override
  late IconData checkbox_unselected = _baseIconClass.checkbox_unselected;
  @override
  late IconData chevron_down = _baseIconClass.chevron_down;
  @override
  late IconData chevron_left = _baseIconClass.chevron_left;
  @override
  late IconData chevron_right = _baseIconClass.chevron_right;
  @override
  late IconData chevron_up = _baseIconClass.chevron_up;
  @override
  late IconData close = _baseIconClass.close;
  @override
  late IconData contact_chat = _baseIconClass.contact_chat;
  @override
  late IconData contact_keyboard = _baseIconClass.contact_keyboard;
  @override
  late IconData contact_mail = _baseIconClass.contact_mail;
  @override
  late IconData contact_phone = _baseIconClass.contact_phone;
  @override
  late IconData date = _baseIconClass.date;
  @override
  late IconData delete = _baseIconClass.delete;
  @override
  late IconData done = _baseIconClass.done;
  @override
  late IconData done_all = _baseIconClass.done_all;
  @override
  late IconData download = _baseIconClass.download;
  @override
  late IconData drag_indicator = _baseIconClass.drag_indicator;
  @override
  late IconData edit = _baseIconClass.edit;
  @override
  late IconData error_circle = _baseIconClass.error_circle;
  @override
  late IconData feedback_checking = _baseIconClass.feedback_checking;
  @override
  late IconData feedback_error = _baseIconClass.feedback_error;
  @override
  late IconData feedback_information = _baseIconClass.feedback_information;
  @override
  late IconData feedback_success = _baseIconClass.feedback_success;
  @override
  late IconData feedback_warning = _baseIconClass.feedback_warning;
  @override
  late IconData filter = _baseIconClass.filter;
  @override
  late IconData hamburger_menu = _baseIconClass.hamburger_menu;
  @override
  late IconData help_circle = _baseIconClass.help_circle;
  @override
  late IconData home = _baseIconClass.home;
  @override
  late IconData inbox = _baseIconClass.inbox;
  @override
  late IconData info_circle = _baseIconClass.info_circle;
  @override
  late IconData language = _baseIconClass.language;
  @override
  late IconData launch = _baseIconClass.launch;
  @override
  late IconData loader = _baseIconClass.loader;
  @override
  late IconData notifications = _baseIconClass.notifications;
  @override
  late IconData orders = _baseIconClass.orders;
  @override
  late IconData overflow = _baseIconClass.overflow;
  @override
  late IconData radio_button_selected = _baseIconClass.radio_button_selected;
  @override
  late IconData radio_button_unselected =
      _baseIconClass.radio_button_unselected;
  @override
  late IconData refresh = _baseIconClass.refresh;
  @override
  late IconData remove = _baseIconClass.remove;
  @override
  late IconData remove_circle = _baseIconClass.remove_circle;
  @override
  late IconData restaurant_menu = _baseIconClass.restaurant_menu;
  @override
  late IconData search = _baseIconClass.search;
  @override
  late IconData share = _baseIconClass.share;
  @override
  late IconData star_empty = _baseIconClass.star_empty;
  @override
  late IconData star_filled = _baseIconClass.star_filled;
  @override
  late IconData support = _baseIconClass.support;
  @override
  late IconData time = _baseIconClass.time;
  @override
  late IconData trending = _baseIconClass.trending;
  @override
  late IconData unfold_less = _baseIconClass.unfold_less;
  @override
  late IconData unfold_more = _baseIconClass.unfold_more;
  @override
  late IconData upload = _baseIconClass.upload;
  @override
  late IconData visibility_off = _baseIconClass.visibility_off;
  @override
  late IconData visibility_on = _baseIconClass.visibility_on;
  @override
  late IconData warning_circle = _baseIconClass.warning_circle;
}
