import 'package:chatting/Log_sign/login.dart';
import 'package:chatting/SlideScreen/slideScreen_items.dart';
import 'package:chatting/components/color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.topCenter, // Aligns the content to the top
                child: PageView.builder(
                  onPageChanged: (index) => setState(() {
                    isLastPage = controller.items.length - 1 == index;
                  }),
                  itemCount: controller.items.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(controller.items[index].image),
                        const SizedBox(height: 40),
                        Center(
                          // Wrap with Center widget
                          child: Text(
                            controller.items[index].title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          controller.items[index].descriptions,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: buildBottomControls(),
            ),
            const SizedBox(
                height: 30), // Adding additional space after bottom controls
          ],
        ),
      ),
    );
  }

  // Bottom controls
  Widget buildBottomControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SmoothPageIndicator
        SmoothPageIndicator(
          controller: pageController,
          count: controller.items.length,
          onDotClicked: (index) => pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
          ),
          effect: const WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: buttoncolor,
          ),
        ),

        // Next Button (ElevatedButton)
        ElevatedButton(
          onPressed: () {
            if (isLastPage) {
              // Navigate to login page
              _navigateToLoginPage();
            } else {
              // Go to the next page
              pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          ),
          child: Text(isLastPage ? "Get started" : "Next"),
        ),
      ],
    );
  }

  // Navigate to login page
  void _navigateToLoginPage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
