import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskie/presentation/screens/splash_screen/splash_text.dart';
import 'package:taskie/presentation/themes/palette.dart';
import 'package:taskie/presentation/utils/constants/size_constants.dart';
import 'package:taskie/presentation/utils/routes/route_list.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor2,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 0.5,
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: SvgPicture.asset(
                  'assets/images/organizing.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.5,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            SplashText.mainText,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            SplashText.subText,
                            textAlign: TextAlign.left,
                            softWrap: true,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 30.0),
                        margin: EdgeInsets.only(left: 80, top: 50),
                        height: Sizes.dimen_80,
                        width: Sizes.dimen_320,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RouteList.homeScreen);
                              },
                              child: Container(
                                height: Sizes.dimen_60,
                                width: Sizes.dimen_60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AppColors.primaryColor2,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.primaryColor2,
                                ),
                              ),
                            ),
                            Text(
                              'Get Started',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
