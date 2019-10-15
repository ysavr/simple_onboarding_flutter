import 'package:flutter/material.dart';

class IntroView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: Image(
                      image: AssetImage('assets/images/intro-page-3.png'),
                      fit: BoxFit.fitHeight,
                      height: 230,
                      width: 230,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                    child: Text('Fast Delivery',
                      style: TextStyle(
                        fontFamily: 'Roboto Medium',
                        color: Colors.deepOrange,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    "Punya kurir sendiri, pengiriman jadi lebih \nmudah dan cepat",
                    style: TextStyle(
                      fontFamily: 'Roboto Regular',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
