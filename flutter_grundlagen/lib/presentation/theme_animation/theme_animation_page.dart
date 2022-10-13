import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/application/theme_service.dart';
import 'package:flutter_grundlagen/presentation/theme_animation/widgets/moon.dart';
import 'package:flutter_grundlagen/presentation/theme_animation/widgets/star.dart';
import 'package:flutter_grundlagen/presentation/theme_animation/widgets/sun.dart';
import 'package:flutter_grundlagen/presentation/theme_animation/widgets/theme_switch.dart';
import 'package:provider/provider.dart';

class ThemeAnimationPage extends StatelessWidget {
  const ThemeAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Animation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            elevation: 7,
            borderRadius: BorderRadius.circular(15),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
              ),
              child: Consumer<ThemeService>(builder: (context, state, child) {
                return Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: state.isDarkMode
                          ? const [
                              Color(0xFF94A9FF),
                              Color(0xFF6B66CC),
                              Color(0xFF200F75),
                            ]
                          : const [
                              Color(0xDDFFFA66),
                              Color(0xDDFFA057),
                              Color(0xDD940B99),
                            ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      // Opacity animation nice
                      Positioned(
                        top: 70,
                        right: 50,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 1 : 0,
                          duration: Duration(
                            milliseconds: Random().nextInt(400 - 150),
                          ),
                          child: const Star(),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 60,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 1 : 0,
                          duration: Duration(
                            milliseconds: Random().nextInt(400 - 150),
                          ),
                          child: const Star(),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 280,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 1 : 0,
                          duration: Duration(
                            milliseconds: Random().nextInt(400 - 150),
                          ),
                          child: const Star(),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 50,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 1 : 0,
                          duration: Duration(
                            milliseconds: Random().nextInt(400 - 150),
                          ),
                          child: const Star(),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: 250,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 1 : 0,
                          duration: Duration(
                            milliseconds: Random().nextInt(400 - 150),
                          ),
                          child: const Star(),
                        ),
                      ),
                      // Animation of position, very cool
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        top: state.isDarkMode ? 100 : 130,
                        right: state.isDarkMode ? 100 : -40,
                        child: AnimatedOpacity(
                          opacity: state.isDarkMode ? 0.7 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: const Moon(),
                        ),
                      ),
                      // There is an animated padding for animations, how cool
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        padding: state.isDarkMode
                            ? const EdgeInsets.only(top: 120)
                            : const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Sun(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          height: 225,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Heading',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Body',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 15),
                              const ThemeSwitcher(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
