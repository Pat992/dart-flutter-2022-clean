import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/presentation/core/buttons/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DeveloperExperience extends StatelessWidget {
  const DeveloperExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveValue = ResponsiveWrapper.of(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: background,
      ),
      // Changes between Column or row
      child: ResponsiveRowColumn(
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        layout: responsiveValue.isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: responsiveValue.equals(TABLET) ? 120 : 50,
              ),
              child: Image.asset('assets/images/dev_exp.jpg'),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Developer Experience',
                    style: TextStyle(
                      color: Colors.teal,
                      fontFamily: fontFamily,
                      fontSize: responsiveValue.isLargerThan(TABLET) ? 20 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Transform your workflow',
                    style: TextStyle(
                      color: textPrimaryLight,
                      fontFamily: fontFamily,
                      fontSize: responsiveValue.isLargerThan(TABLET) ? 60 : 40,
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Take control of your codebase with automated testing, developer tooling, and everything else you need to build production-quality apps.',
                    style: TextStyle(
                      color: textPrimaryLight,
                      fontFamily: fontFamily,
                      fontSize: responsiveValue.isLargerThan(TABLET) ? 20 : 18,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const IntrinsicWidth(
                    child: CustomButton(
                      inDrawer: false,
                      inPage: true,
                      text: 'Flutter for developers',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
