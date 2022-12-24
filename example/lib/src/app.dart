import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/blocs/blocs.dart';
import 'package:example/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterDesignShowcaseApp extends StatelessWidget {
  const FlutterDesignShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeConfigBloc>(
      create: (_) => ThemeConfigBloc(),
      child: BlocBuilder<ThemeConfigBloc, ThemeConfigState>(
        builder: (context, state) {
          return FlutterDesignApp(
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
