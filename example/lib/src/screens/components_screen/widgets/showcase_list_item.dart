import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/material.dart';

class ShowcaseListItem extends StatelessWidget {
  final String title;
  final bool shouldOpenSubmenu;
  final Widget child;

  const ShowcaseListItem(
    this.title, {
    this.shouldOpenSubmenu = false,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        ListTile(
          trailing: Icon(
            Icons.chevron_right,
            color: theme.colors.neutral.black,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: theme.spacings.spacing12,
            horizontal: theme.spacings.spacing12,
          ),
          onTap: () => Navigator.push(
            context,
            shouldOpenSubmenu == true
                ? MaterialPageRoute(builder: (_) => child)
                : SlideUpRouteBuilder(child: child),
          ),
          title: Text(
            title,
            style: theme.textStyles.paragraph_400,
          ),
        ),
        const Divider(height: 0)
      ],
    );
  }
}
