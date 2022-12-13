import 'package:flutter_design_extension/flutter_design_extension.dart';

import 'package:flutter/material.dart';

import 'widget/tabbar_view.dart';

class SnackBarShowcaseScreen extends StatefulWidget {
  const SnackBarShowcaseScreen({super.key});

  @override
  State<SnackBarShowcaseScreen> createState() => _SnackBarScreenState();
}

class _SnackBarScreenState extends State<SnackBarShowcaseScreen> {
  late DesignTokensThemeExtension theme;
  int tabIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    tabs = List.filled(4, const TabbarView());
  }

  @override
  Widget build(BuildContext context) {
    theme = context.theme;
    //TODO: Implement bottom navigation bar in custom scaffold when PR gets merge
    return Scaffold(
      backgroundColor: theme.colors.neutral.gray05,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Snack Bars'),
        iconTheme: IconThemeData(color: theme.colors.neutral.white),
        actionsIconTheme: IconThemeData(color: theme.colors.neutral.white),
        backgroundColor: theme.colors.brand.main,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: theme.colors.brand.main,
        unselectedItemColor: theme.colors.neutral.black,
        currentIndex: tabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.spacing16,
          vertical: theme.spacings.spacing32,
        ),
        child: tabs[tabIndex],
      ),
    );
  }
}
