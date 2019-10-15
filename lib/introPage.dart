import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'introView1.dart';
import 'introView2.dart';
import 'introView3.dart';
import 'introView4.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  int position = 0;
  bool lastPage = false;
  bool visible = true;
  PageController pageController;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  final List<Widget> slider = <Widget>[
    IntroView1(),
    IntroView2(),
    IntroView3(),
    IntroView4(),
  ];

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    animationController = AnimationController(
      duration: Duration(milliseconds: 300), vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                controller: pageController,
                itemCount: slider.length,
                itemBuilder: (context, index){
                  return slider[index % slider.length];
                },
                onPageChanged: (index){
                  setState(() {
                    position = index;
                    if (position == slider.length - 1) {
                      lastPage = true;
                      visible = false;
                      animationController.forward();
                    } else {
                      lastPage = false;
                      animationController.reset();
                    }
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, left: 10),
                  child: buildIndicator(),
                ),
              ),
              Positioned(
                right: 25.0,
                top: 45.0,
                child: lastPage ? AnimatedOpacity(
                  opacity: visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                ) : GestureDetector(
                  onTap: (){
                    setState(() {
                      //position = slider.length - 1;
                      pageController.jumpToPage(slider.length - 1);
                      lastPage = true;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text('Skip',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontFamily: 'Roboto Medium'
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 25.0,
                top: 45.0,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: lastPage ? GestureDetector(
                    onTap: () => null,
                    child: Container(
                      color: Colors.transparent,
                      child: Text('Done',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                            fontFamily: 'Roboto Medium'
                        ),
                      ),
                    ),
                  ) : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DotsIndicator buildIndicator() {
    return DotsIndicator(
      dotsCount: slider.length,
      position: position,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(50.0, 9.0),
        color: Colors.deepOrange.withOpacity(0.3),
        activeColor: Colors.deepOrange,
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
