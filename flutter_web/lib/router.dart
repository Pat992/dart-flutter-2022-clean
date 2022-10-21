import 'package:flutter/material.dart';
import 'package:flutter_web/presentation/devpage/dev_page.dart';
import 'package:flutter_web/presentation/ecopage/eco_page.dart';
import 'package:flutter_web/presentation/homepage/home_page.dart';
import 'package:routemaster/routemaster.dart';

final router = RouteMap(
    onUnknownRoute: (route) =>
        const MaterialPage(child: Placeholder(color: Colors.amber)),
    routes: {
      '/': (_) => const Redirect('/home'),
      HomePage.path: (_) => const MaterialPage(child: HomePage()),
      DevPage.path: (_) => const MaterialPage(child: DevPage()),
      EcoPage.path: (_) => const MaterialPage(child: EcoPage()),
    });
