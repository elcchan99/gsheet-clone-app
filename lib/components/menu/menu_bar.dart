import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsheet_app/components/menu/top_menu_bar.dart';
import 'package:gsheet_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../sprite_icon.dart';
import 'menu_item.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 64,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
          padding: const EdgeInsets.all(8),
          child: HomeIconButton(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                    child: Text(
                      "Flutter schoolbook",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  buildTopIconButton(context,
                      icon: SpriteIcon(
                        icon: SpriteIcons.STAR_FILLED,
                      ),
                      tooltip: "Star",
                      onPressed: () {}),
                  buildTopIconButton(context,
                      icon: SpriteIcon(
                        icon: SpriteIcons.FOLDER_MOVE,
                      ),
                      tooltip: "Move",
                      onPressed: () {}),
                  buildTopIconButton(context,
                      icon: SpriteIcon(
                        icon: SpriteIcons.CLOUD_CHECK,
                      ),
                      tooltip: "See document status",
                      onPressed: () {}),
                ]),
                TopMenuBar()
              ]),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 6, left: 16),
          child: Text(
            "Last edit was 2 days ago",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )),
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 24,
                      width: 24,
                      child: IconButton(
                        icon: SpriteIcon(
                          icon: SpriteIcons.INSERT_COMMENT,
                        ),
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        tooltip: "Open comment history",
                      )),
                  SizedBox(width: 14),
                  Container(
                    margin:
                        EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                    child: RawMaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      constraints: BoxConstraints(),
                      fillColor: BUTTON_COLOR,
                      padding: EdgeInsets.only(left: 12, right: 16),
                      elevation: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SpriteIcon(
                                icon: SpriteIcons.APP_SHARE,
                                backgroundColor: BUTTON_COLOR,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text("Share",
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 14),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png'),
                  )
                ]))
      ]),
    );
  }

  Widget buildTopIconButton(context,
      {@required Widget icon, Function onPressed, String tooltip}) {
    return SizedBox(
        height: 24,
        width: 24,
        child: IconButton(
          icon: icon,
          padding: EdgeInsets.all(0),
          onPressed: onPressed ?? () {},
          tooltip: tooltip,
        ));
  }
}

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Sheets Home",
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: WebsafeSvg.asset("icons/google-sheets.svg",
            fit: BoxFit.contain, height: 40, width: 40),
        onPressed: () {},
      ),
    );
  }
}
