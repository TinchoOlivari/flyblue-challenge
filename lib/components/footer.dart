import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FooterWidget extends StatefulWidget {
  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: queryData.size.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '65.840*',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Color(0xff00b6cf),
                  ),
                ),
                Text(
                  'VER DETALLE',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff00b6cf),
                  ),
                ),
              ],
            ),
            CupertinoButton(
              padding: EdgeInsets.only(left: 50, right: 50),
              minSize: 50,
              onPressed: () {},
              color: Color(0xff00b6cf),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Text('Reservar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}
