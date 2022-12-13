import 'package:flutter/material.dart';

/// Base Interface class that holds definitions of all possible icons.
///
/// To be **implemented** inside specific LTR/RTL class
/// (e.g. [DesignIconsLTR]).
abstract class IconFontBaseInterface {
  IconFontBaseInterface._();

  late final IconData add;
  late final IconData add_circle;
  late final IconData add_photo;
  late final IconData arrow_back;
  late final IconData arrow_collapse;
  late final IconData arrow_downward;
  late final IconData arrow_expand;
  late final IconData arrow_forward;
  late final IconData arrow_upward;
  late final IconData check_circle;
  late final IconData checkbox_indeterminate;
  late final IconData checkbox_selected;
  late final IconData checkbox_unselected;
  late final IconData chevron_down;
  late final IconData chevron_left;
  late final IconData chevron_right;
  late final IconData chevron_up;
  late final IconData close;
  late final IconData contact_chat;
  late final IconData contact_keyboard;
  late final IconData contact_mail;
  late final IconData contact_phone;
  late final IconData date;
  late final IconData delete;
  late final IconData done;
  late final IconData done_all;
  late final IconData download;
  late final IconData drag_indicator;
  late final IconData edit;
  late final IconData error_circle;
  late final IconData feedback_checking;
  late final IconData feedback_error;
  late final IconData feedback_information;
  late final IconData feedback_success;
  late final IconData feedback_warning;
  late final IconData filter;
  late final IconData hamburger_menu;
  late final IconData help_circle;
  late final IconData home;
  late final IconData inbox;
  late final IconData info_circle;
  late final IconData language;
  late final IconData launch;
  late final IconData loader;
  late final IconData notifications;
  late final IconData orders;
  late final IconData overflow;
  late final IconData radio_button_selected;
  late final IconData radio_button_unselected;
  late final IconData refresh;
  late final IconData remove;
  late final IconData remove_circle;
  late final IconData restaurant_menu;
  late final IconData search;
  late final IconData share;
  late final IconData star_empty;
  late final IconData star_filled;
  late final IconData support;
  late final IconData time;
  late final IconData trending;
  late final IconData unfold_less;
  late final IconData unfold_more;
  late final IconData upload;
  late final IconData visibility_off;
  late final IconData visibility_on;
  late final IconData warning_circle;
}
