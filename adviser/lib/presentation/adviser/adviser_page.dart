import 'package:adviser/application/theme/theme_service_provider.dart';
import 'package:adviser/presentation/adviser/widgets/advise_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdviserPage extends StatelessWidget {
  const AdviserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Adviser', style: Theme.of(context).textTheme.headline1),
        actions: [
          Switch(
            value: Provider.of<ThemeServiceImpl>(context).isDarkMode,
            onChanged: (_) =>
                Provider.of<ThemeServiceImpl>(context, listen: false)
                    .toggleTheme(),
          ),
          Switch(
            value: Provider.of<ThemeServiceImpl>(context).useSystemTheme,
            onChanged: (_) =>
                Provider.of<ThemeServiceImpl>(context, listen: false)
                    .toggleUseSystemTheme(),
          ),
        ],
      ),
      body: const AdvisePageBody(),
    );
  }
}
