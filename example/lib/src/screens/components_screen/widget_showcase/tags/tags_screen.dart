import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:example/src/utility_widgets/layout/widget_showcase_screen.dart';
import 'package:flutter/material.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final spacings = theme.spacings;
    return WidgetShowcaseScreen(
      title: 'Tags',
      child: Center(
        child: Column(
          children: [
            SizedBox(height: spacings.spacing16),
            const DesignTag(
              tagType: DesignTagType.success,
              label: 'Delivered',
            ),
            SizedBox(height: spacings.spacing16),
            const DesignTag(
              tagType: DesignTagType.error,
              label: 'Cancellepd',
            ),
            SizedBox(height: spacings.spacing16),
            const DesignTag(
              tagType: DesignTagType.info,
              label: 'Pickup',
            ),
            SizedBox(height: spacings.spacing16),
            const DesignTag(
              tagType: DesignTagType.neutral,
              label: 'In Delivery',
            ),
            SizedBox(height: spacings.spacing16),
            const DesignTag(
              tagType: DesignTagType.static,
              label: 'Static',
            )
          ],
        ),
      ),
    );
  }
}
