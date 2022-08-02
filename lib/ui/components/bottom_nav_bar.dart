import 'package:cripto_currency_app_flutter/constants/my_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  PageController pageController;

  BottomNavBar({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(MyPage.Home.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    icon: const Icon(Icons.home_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(MyPage.Market.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    icon: const Icon(Icons.bar_chart_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(MyPage.Profile.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    icon: const Icon(Icons.person_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(MyPage.WatchList.index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    icon: const Icon(Icons.bookmark_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
