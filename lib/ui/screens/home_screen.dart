import 'package:cripto_currency_app_flutter/ui/components/home_page_view.dart';
import 'package:flutter/material.dart';
import '../components/theme_switcher.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Crypto"),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        actions: const [
          ThemeSwitcher(),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomePageView(pageController: _pageController),
            ],
          ),
        ),
      ),
    );
  }
}
