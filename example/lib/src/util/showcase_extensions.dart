import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

extension TextStyleShowcaseExtension on TextStyleTokens {
  List<TextStyle> get values => [
        heading1_700,
        heading2_700,
        heading3_700,
        heading3_500,
        paragraph_700,
        paragraph_500,
        paragraph_400,
        secondary_700,
        secondary_500,
        secondary_400,
        caption_700,
        caption_400,
        buttonText,
        pageTitleMobile,
        sectionTitleMobile,
        sectionSubtitleMobile,
      ];
}

extension ColorBrandShowcaseExtension on ColorBrand {
  List<Color> get values => [main, dark, secondary];
}

extension ColorInteractionShowcaseExtension on ColorInteraction {
  List<Color> get values => [main, hover, pressed];
}

extension ColorMessagingShowcaseExtension on ColorMessagingLight {
  List<Color> get values => [
        error,
        errorLight,
        information,
        informationLight,
        success,
        successLight,
        warning,
        warningLight,
      ];
}

extension ColorNeutralShowcaseExtension on ColorNeutral {
  List<Color> get values => [
        black,
        gray50,
        gray40,
        gray20,
        gray10,
        gray05,
        white,
      ];
}

extension GeneralColorShowcaseExtension on Color {
  String get name => '#${value.toRadixString(16).toUpperCase().substring(2)}';
}

extension IconsShowcaseExtension on IconTokens {
  Map<String, IconData> get values => {
        'add': add,
        'add_circle': add_circle,
        'add_photo': add_photo,
        'arrow_back': arrow_back,
        'arrow_collapse': arrow_collapse,
        'arrow_downward': arrow_downward,
        'arrow_expand': arrow_expand,
        'arrow_forward': arrow_forward,
        'arrow_upward': arrow_upward,
        'check_circle': check_circle,
        'checkbox_indeterminate': checkbox_indeterminate,
        'checkbox_selected': checkbox_selected,
        'checkbox_unselected': checkbox_unselected,
        'chevron_down': chevron_down,
        'chevron_left': chevron_left,
        'chevron_right': chevron_right,
        'chevron_up': chevron_up,
        'close': close,
        'contact_chat': contact_chat,
        'contact_keyboard': contact_keyboard,
        'contact_mail': contact_mail,
        'contact_phone': contact_phone,
        'date': date,
        'delete': delete,
        'done': done,
        'done_all': done_all,
        'download': download,
        'drag_indicator': drag_indicator,
        'edit': edit,
        'error_circle': error_circle,
        'feedback_checking': feedback_checking,
        'feedback_error': feedback_error,
        'feedback_information': feedback_information,
        'feedback_success': feedback_success,
        'feedback_warning': feedback_warning,
        'filter': filter,
        'hamburger_menu': hamburger_menu,
        'help_circle': help_circle,
        'home': home,
        'inbox': inbox,
        'info_circle': info_circle,
        'language': language,
        'launch': launch,
        'loader': loader,
        'notifications': notifications,
        'orders': orders,
        'overflow': overflow,
        'radio_button_selected': radio_button_selected,
        'radio_button_unselected': radio_button_unselected,
        'refresh': refresh,
        'remove': remove,
        'remove_circle': remove_circle,
        'restaurant_menu': restaurant_menu,
        'search': search,
        'share': share,
        'star_empty': star_empty,
        'star_filled': star_filled,
        'support': support,
        'time': time,
        'trending': trending,
        'unfold_less': unfold_less,
        'unfold_more': unfold_more,
        'upload': upload,
        'visibility_off': visibility_off,
        'visibility_on': visibility_on,
        'warning_circle': warning_circle,
      };
}
