import 'package:flutter/material.dart';
import 'package:gsheet_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'components/menu/menu_bar.dart';
import 'components/tool_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Roboto"),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        MenuBar(),
        Divider(
          height: 1,
        ),
        ToolBar(),
        Divider(
          height: 1,
        ),
        DropdownButton(
          onChanged: (value) {},
          items: [
            DropdownMenuItem(
                value: 1, child: SizedBox(width: 100, child: Text("HeHe1"))),
            DropdownMenuItem(
                value: 2, child: SizedBox(width: 100, child: Text("HeHe2"))),
            DropdownMenuItem(
                value: 3, child: SizedBox(width: 100, child: Text("HeHe3"))),
          ],
        ),
        Expanded(
            child: Container(
                color: Colors.blue,
                child: Center(
                    child: Container(
                  width: 24,
                  height: 24,
                  color: Colors.red,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: -16,
                        child: Container(
                            width: 20,
                            height: 20,
                            child: Stack(overflow: Overflow.clip, children: [
                              Positioned(
                                  top: -70,
                                  left: 0,
                                  child: WebsafeSvg.asset(
                                    "icons/sprite-22.svg",
                                    color: Colors.white,
                                  ))
                            ])),
                      )
                    ],
                  ),
                )))),
      ]),
    );
  }
}
