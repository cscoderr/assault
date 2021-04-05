import 'package:assault/providers/intro_provider.dart';
import 'package:assault/ui/core/size_config.dart';
import 'package:assault/ui/core/solid_button.dart';
import 'package:assault/ui/core/styles.dart';
import 'package:assault/ui/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController;

  List<Widget> _indicators(BuildContext context) {
    final introProvider = Provider.of<IntroProvider>(context);
    List<Widget> _indicators = [];

    for (int i = 0; i < introProvider.introModel.length; i++) {
      _indicators.add(
        Padding(
          padding: const EdgeInsets.only(
            right: 10.0,
          ),
          child: Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              color: currentColor(i, context),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
    return _indicators;
  }

  Color currentColor(int index, BuildContext context) {
    final introProvider = Provider.of<IntroProvider>(context);
    return introProvider.currentIndex == index
        ? Color(0xFF727AEF)
        : Color(0xFFEFEFEF);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    final introProvider = Provider.of<IntroProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            children: [
              introProvider.currentIndex != 2
                  ? Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          ExtendedNavigator.of(context)
                              .popAndPush(Routes.loginScreen);
                        },
                        style: TextButton.styleFrom(
                          primary: Color(0xFF727AEF),
                        ),
                        child: Text(
                          "Skip",
                        ),
                      ),
                    )
                  : Text(''),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: introProvider.introModel.length,
                  onPageChanged: (value) {
                    introProvider.setIndex(value);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 90.0,
                            backgroundColor: Color(0xFFEFEFEF),
                            // child: SvgPicture.asset(
                            //   introProvider.introModel[index].imagePath,
                            // ),
                          ),
                          SizedBox(
                            height: SizeConfig.minBlockVertical * 4.0,
                          ),
                          Text(
                            introProvider.introModel[index].title,
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.minBlockVertical * 2.0,
                          ),
                          Text(
                            introProvider.introModel[index].content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indicators(context),
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 10.0,
              ),
              SolidButton(
                text: introProvider.currentIndex == 2 ? 'Get Started' : 'Next',
                onPressed: () {
                  if (introProvider.currentIndex == 2) {
                    // ExtendedNavigator.of(context)
                    //     .popAndPush(Routes.introScreen);
                    // userProvider.saveLaunchKey(key: true);
                  } else {
                    int currentIndex = introProvider.currentIndex;
                    introProvider.setIndex(currentIndex++);
                    _pageController.jumpToPage(currentIndex);
                  }
                },
                color: kPrimaryColor,
                textColor: Colors.white,
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical * 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
