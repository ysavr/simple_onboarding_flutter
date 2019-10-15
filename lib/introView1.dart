import 'package:flutter/material.dart';

class IntroView1 extends StatelessWidget {
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
                      image: AssetImage('assets/images/intro-page-1.png'),
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
                    child: Text('Easy Search Product',
                      style: TextStyle(
                        fontFamily: 'Roboto Medium',
                        color: Colors.deepOrange,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Cari obat untuk supply outletmu jadi \nlebih mudah ",
                      style: TextStyle(
                        fontFamily: 'Roboto Regular',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
