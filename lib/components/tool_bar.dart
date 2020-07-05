import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsheet_app/components/sprite_icon.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30, top: 6, bottom: 6, right: 5),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ToolButton(
              child: SpriteIcon(icon: SpriteIcons.UNDO), onPressed: () {}),
          ToolButton(
              child: SpriteIcon(icon: SpriteIcons.REDO), onPressed: () {}),
          ToolButton(
              child: SpriteIcon(icon: SpriteIcons.PRINT), onPressed: () {}),
          ToolButton(
              child: SpriteIcon(icon: SpriteIcons.PAINT), onPressed: () {}),
          ToolBarDivider(),
          ToolButton(
              child: SpriteIcon(icon: SpriteIcons.PAINT), onPressed: () {}),
          ToolBarDivider(),
          buildTextToolButton(context,
              text: "\$", onPressed: () {}, tooltip: "Format as currency"),
          buildTextToolButton(context,
              text: "\%", onPressed: () {}, tooltip: "Format as percent"),
        ]));
  }

  Widget buildTextToolButton(contexnt,
      {Key key, @required String text, Function onPressed, String tooltip}) {
    return ToolButton(
      key: key,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontSize: 13,
        ),
      ),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}

typedef WidgetCallBack = Widget Function(dynamic _);

class ToolButton extends StatelessWidget {
  const ToolButton(
      {Key key, @required this.child, this.onPressed, this.tooltip})
      : super(key: key);
  final Widget child;
  final Function onPressed;
  final String tooltip;
  static final double size = 26;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size,
        width: size,
        child: IconButton(
          icon: child,
          padding: EdgeInsets.all(0),
          onPressed: onPressed ?? () {},
        ));
  }
}

class ToolBarDivider extends StatelessWidget {
  const ToolBarDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 9,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(color: Colors.grey),
    );
  }
}
