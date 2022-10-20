import 'package:flutter/material.dart';

class SaveProgressOverlay extends StatelessWidget {
  final bool saving;
  const SaveProgressOverlay({Key? key, required this.saving}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return IgnorePointer(
      ignoring: !saving,
      child: Visibility(
        visible: saving,
        child: Center(
          child:
              CircularProgressIndicator(color: themeData.colorScheme.secondary),
        ),
      ),
    );
  }
}
