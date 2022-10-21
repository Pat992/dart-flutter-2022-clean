import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/presentation/core/page_wrapper/centered_constrained_wrapper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DevelopmentStart extends StatelessWidget {
  const DevelopmentStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveValue = ResponsiveWrapper.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade50.withOpacity(0.3),
            Colors.teal.withOpacity(0.1),
          ],
        ),
      ),
      child: CenteredConstrainedWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ResponsiveRowColumn(
              columnVerticalDirection: VerticalDirection.up,
              columnMainAxisSize: MainAxisSize.min,
              layout: responsiveValue.isSmallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      child: Text(
                        'Build more with Flutter',
                        textAlign: responsiveValue.isSmallerThan(DESKTOP)
                            ? TextAlign.center
                            : TextAlign.start,
                        style: TextStyle(
                          color: textPrimaryLight,
                          fontFamily: fontFamily,
                          fontSize:
                              responsiveValue.isLargerThan(TABLET) ? 75 : 40,
                          height: 0.9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveValue.equals(TABLET) ? 120 : 50,
                      vertical: 20,
                    ),
                    child: Image.asset('assets/images/development.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              child: Text(
                'Flutter transforms the app development process so you can ship more, faster. Deploy to six targets from a single codebase.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textPrimaryLight,
                  fontFamily: fontFamily,
                  fontSize: responsiveValue.isLargerThan(TABLET) ? 38 : 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
