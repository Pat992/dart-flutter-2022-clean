import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/core/menu/custom_app_bar.dart';
import 'package:flutter_web/presentation/core/menu/menu_bar.dart';
import 'package:flutter_web/presentation/core/menu/widgets/custom_drawer.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  const PageTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveValue = ResponsiveWrapper.of(context);

    return Scaffold(
      appBar: responsiveValue.isSmallerThan(DESKTOP)
          ? const PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: CustomAppBar(),
            )
          : const PreferredSize(
              preferredSize: Size(double.infinity, 66),
              child: MenuBar(),
            ),
      body: child,
      endDrawer: const CustomDrawer(),
    );
  }
}
