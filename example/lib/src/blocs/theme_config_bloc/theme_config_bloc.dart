import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/blocs/theme_config_bloc/theme_config_event.dart';
import 'package:example/src/blocs/theme_config_bloc/theme_config_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _initialState = ThemeConfigInitialized(
  textDirection: TextDirection.ltr,
  brand: DefaultBrand(),
);

class ThemeConfigBloc extends Bloc<ThemeConfigEvent, ThemeConfigState> {
  ThemeConfigBloc() : super(_initialState) {
    // Event-Handler definitions
    on<UpdateThemeConfig>(_mapUpdateThemeConfigToState);
  }

  void _mapUpdateThemeConfigToState(
    UpdateThemeConfig event,
    Emitter<ThemeConfigState> emit,
  ) {
    return emit(
      ThemeConfigInitialized(
        textDirection: event.textDirection,
        brand: event.brand,
      ),
    );
  }
}
