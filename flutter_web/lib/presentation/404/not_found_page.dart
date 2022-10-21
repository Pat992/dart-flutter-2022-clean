import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/presentation/core/buttons/custom_button.dart';
import 'package:flutter_web/presentation/core/page_wrapper/centered_constrained_wrapper.dart';
import 'package:flutter_web/presentation/core/page_wrapper/page_template.dart';
import 'package:flutter_web/presentation/homepage/home_page.dart';
import 'package:routemaster/routemaster.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: ListView(
        children: [
          CenteredConstrainedWrapper(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 50,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sorry, we couldn\'t find that page…',
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: primary,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "404",
                    style: TextStyle(
                        fontFamily: fontFamily,
                        color: textPrimaryLight,
                        fontWeight: FontWeight.bold,
                        height: 0.9,
                        fontSize: 60),
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: Image.asset("assets/images/mixer.png")),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "But Dash is here to help! Maybe this will point you in the right direction?",
                    style: TextStyle(
                        fontFamily: fontFamily,
                        color: textPrimaryLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntrinsicWidth(
                    child: CustomButton(
                      text: "Back to homepage",
                      callback: () =>
                          Routemaster.of(context).push(HomePage.path),
                      inDrawer: false,
                      inPage: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
