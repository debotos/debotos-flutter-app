import 'package:debotos_app/config/constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
    var sPrefs = await SharedPreferences.getInstance();
    sPrefs.setBool(kWelcomeScreenDisplayed, true);
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/debotos.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.topCenter,
    );
  }

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: const Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Center(
                child: Text(
              "DEBOTOS DAS",
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Debotos Das",
          body:
              "Full-stack developer from Bangladesh passionate about JavaScript stacks.",
          image: _buildImage('debotos.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Debotos Das",
          body:
              "Consider me as a hard-working friendly individual who enjoys communicating with others & searching for a challenging new role where skills and knowledge can be applied.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
          ),
        ),
        PageViewModel(
          title: "Debotos Das",
          body:
              "Web Development, Mobile App Development & Desktop App Development",
          image: _buildImage('debotos.png'),
          footer: ElevatedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Go',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Debotos Das",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Just one step away to reach me. ", style: bodyStyle),
              Icon(Icons.mail_lock_outlined, color: Colors.cyan),
              Text(
                "You can use the contact info in the app or send me a direct message using the form.",
                style: bodyStyle,
                textAlign: TextAlign.center,
              )
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('debotos.png'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
