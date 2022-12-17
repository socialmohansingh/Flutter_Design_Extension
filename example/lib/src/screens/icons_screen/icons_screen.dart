import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/util/showcase_extensions.dart';
import 'package:flutter/material.dart';

class IconWithName {
  final String name;
  final IconData icon;

  IconWithName({required this.name, required this.icon});
}

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final List<IconWithName> iconsList = theme.icons.values.entries
        .map((e) => IconWithName(name: e.key, icon: e.value))
        .toList();

    return CustomScaffold(
      title: 'Icons',
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.spacing16,
            vertical: theme.spacings.spacing24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacings.spacing24),
              Text(
                'DesignIconsLTR',
                style: theme.textStyles.secondary_500,
              ),
              SizedBox(height: theme.spacings.spacing24),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  childAspectRatio: 1,
                  mainAxisExtent: 64,
                  crossAxisSpacing: theme.spacings.spacing16,
                  mainAxisSpacing: theme.spacings.spacing16,
                ),
                itemCount: iconsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DesignIcon(
                        iconsList[index].icon,
                        iconSize: DesignIconSize.large,
                        color: theme.colors.neutral.black,
                      ),
                      SizedBox(height: theme.spacings.spacing4),
                      Text(
                        iconsList[index].name,
                        style: theme.textStyles.caption_700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: theme.spacings.spacing48),
            ],
          ),
        ),
      ),
    );
  }
}
