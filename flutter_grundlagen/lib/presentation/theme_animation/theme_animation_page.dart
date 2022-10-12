import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/application/theme_service.dart';
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
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dark Theme:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 14),
                        ),
                        const SizedBox(width: 15),
                        Consumer<ThemeService>(
                            builder: (context, state, child) {
                          return Switch(
                            value: state.isDarkMode,
                            onChanged: (_) => Provider.of<ThemeService>(context,
                                    listen: false)
                                .toggleTheme(),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
