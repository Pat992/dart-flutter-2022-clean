import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/presentation/core/page_wrapper/centered_constrained_wrapper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EcosystemStart extends StatelessWidget {
  const EcosystemStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveValue = ResponsiveWrapper.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.pink.shade50,
            Colors.blue.shade50,
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
                        'A strong ecosystem, powered by open source',
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
                    child: Image.asset('assets/images/ecosystem.png'),
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
                'From packages and plugins to friendly developers, find all of the resources you need to be successful with Flutter.',
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
