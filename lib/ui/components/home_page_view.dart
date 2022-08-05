import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageView extends StatefulWidget {
  PageController pageController;

  HomePageView({Key? key, required this.pageController}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var images = [
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 160,
        child: Stack(
          children: [
            PageView(
              controller: widget.pageController,
              children: [
                buildBanner(images[0]),
                buildBanner(images[1]),
                buildBanner(images[2]),
                buildBanner(images[3]),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SmoothPageIndicator(
                  controller: widget.pageController,
                  count: 4,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 5,
                    dotHeight: 5,
                   activeDotColor: Colors.white,
                    expansionFactor: 2,
                  ),
                  onDotClicked: (index) => widget.pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect buildBanner(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    );
  }
}
