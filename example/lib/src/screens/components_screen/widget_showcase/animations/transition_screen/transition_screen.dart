import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/screens/components_screen/widget_showcase/animations/transition_screen/sliding_from_bottom_screen.dart';
import 'package:example/src/screens/components_screen/widget_showcase/animations/transition_screen/sliding_from_right_screen.dart';
import 'package:flutter/material.dart';

class TransitionScreen extends StatelessWidget {
  const TransitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Transition Screen',
      body: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.all(context.theme.spacings.spacing32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.colors.neutral.gray50,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.50,
                  MediaQuery.of(context).size.width * 0.15,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                SlideLeftInRightOutRouteBuilder(
                    slidingInChild: const SlidingFromRightScreen(),
                    slidingOutChild: this,
                    settings: const RouteSettings()),
              ),
              child: Text(
                'Slide From Right',
                style: context.theme.textStyles.buttonText,
              ),
            ),
          )),
          Center(
              child: Container(
            margin: EdgeInsets.all(context.theme.spacings.spacing32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.colors.neutral.black,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.50,
                  MediaQuery.of(context).size.width * 0.15,
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                SlideUpRouteBuilder(child: const SlidingFromBottomScreen()),
              ),
              child: Text(
                'Slide From Bottom',
                style: context.theme.textStyles.buttonText,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
