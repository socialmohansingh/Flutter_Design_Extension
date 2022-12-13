import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class RadioButtonsShowcaseScreen extends StatefulWidget {
  const RadioButtonsShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<RadioButtonsShowcaseScreen> createState() =>
      _RadioButtonsShowcaseScreenState();
}

class _RadioButtonsShowcaseScreenState
    extends State<RadioButtonsShowcaseScreen> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return WidgetShowcaseScreen(
      title: 'Radio Buttons',
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          DesignRadioButton<int>(
              value: 0,
              groupValue: selectedIndex,
              onChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
          const SizedBox(
            height: 15,
          ),
          DesignRadioListTile<int>(
            value: 1,
            groupValue: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            title: 'No Subtitle',
          ),
          const SizedBox(
            height: 15,
          ),
          DesignRadioListTile<int>(
            value: 2,
            groupValue: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            title: 'Title',
            subtitle: 'Subtitle',
          ),
          const SizedBox(
            height: 15,
          ),
          DesignRadioListTile<int>(
            value: 3,
            groupValue: selectedIndex,
            enabled: false,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            title: 'Disabled',
          )
        ],
      ),
    );
  }
}
