import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class CheckBoxesShowcaseScreen extends StatefulWidget {
  const CheckBoxesShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxesShowcaseScreen> createState() =>
      _CheckBoxesShowcaseScreenState();
}

class _CheckBoxesShowcaseScreenState extends State<CheckBoxesShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsList = [
      defaultCheckBox(),
      tristateCheckBox(),
      disabledChosenCheckBox(),
      disabledNotChosenCheckBox(),
      disabledTristateCheckBox(),
      titleCheckBox(),
      titleSubtitleCheckBox(),
    ];
    final List<String> titles = [
      'Default Check Box',
      'Tristate Check Box',
      'Disabled Chosen Checkbox',
      'Disabled Not Chosen Check Box',
      'Disabled Tristate Checkbox',
      'Title Check Box',
      'Title Subtitle Check Box',
    ];
    final theme = context.theme;
    return WidgetShowcaseScreen(
        title: "Check Boxes",
        child: Center(
          child: ListView.builder(
              itemCount: widgetsList.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Text(
                      titles[i],
                      style: theme.textStyles.heading3_500,
                    ),
                    widgetsList[i],
                    SizedBox(
                      height: theme.spacings.spacing8,
                    )
                  ],
                );
              }),
        ));
  }

  bool? defaultIsChosen = true;
  Widget defaultCheckBox() {
    return DesignCheckBox(
      value: defaultIsChosen,
      onChanged: (value) {
        setState(() {
          defaultIsChosen = value;
        });
      },
    );
  }

  bool? tristateIsChosen = true;
  Widget tristateCheckBox() {
    return DesignCheckBox(
      value: tristateIsChosen,
      tristate: true,
      onChanged: (value) {
        setState(() {
          tristateIsChosen = value;
        });
      },
    );
  }

  bool? disabledChosenIsChosen = true;
  Widget disabledChosenCheckBox() {
    return DesignCheckBox(
      value: disabledChosenIsChosen,
      enabled: false,
      onChanged: (value) {
        setState(() {
          disabledChosenIsChosen = value;
        });
      },
    );
  }

  bool? disabledNotChosenIsChosen = false;
  Widget disabledNotChosenCheckBox() {
    return DesignCheckBox(
      value: disabledNotChosenIsChosen,
      enabled: false,
      onChanged: (value) {
        setState(() {
          disabledNotChosenIsChosen = value;
        });
      },
    );
  }

  bool? disabledTristateIsChosen;
  Widget disabledTristateCheckBox() {
    return DesignCheckBox(
      value: disabledTristateIsChosen,
      enabled: false,
      tristate: true,
      onChanged: (value) {
        setState(() {
          disabledTristateIsChosen = value;
        });
      },
    );
  }

  bool? titleCheckBoxIsChosen = true;
  Widget titleCheckBox() {
    return DesignCheckBoxListTile(
        value: titleCheckBoxIsChosen,
        onChanged: (value) {
          setState(() {
            titleCheckBoxIsChosen = value;
          });
        },
        title: 'Title');
  }

  bool? titleSubtitleCheckBoxIsChosen = true;
  Widget titleSubtitleCheckBox() {
    return DesignCheckBoxListTile(
      value: titleSubtitleCheckBoxIsChosen,
      onChanged: (value) {
        setState(() {
          titleSubtitleCheckBoxIsChosen = value;
        });
      },
      title: 'Title',
      subtitle: 'Subtitle',
    );
  }
}
