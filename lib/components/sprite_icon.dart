import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

const String SPRITE_SHEET_1 = "icons/material_common_sprite190_grey_medium.svg";
const String SPRITE_SHEET_2 = "icons/sprite-22.svg";

class SpriteIcon extends StatelessWidget {
  const SpriteIcon(
      {Key key,
      @required this.icon,
      background,
      this.decoration,
      this.color,
      this.backgroundColor})
      : super(key: key);
  final SpriteIconMetaData icon;
  final BoxDecoration decoration;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: icon.width,
        height: icon.height,
        color: backgroundColor,
        decoration: decoration,
        child: Stack(overflow: Overflow.clip, children: [
          Positioned(
            top: icon.offsetY,
            left: icon.offsetX,
            child: WebsafeSvg.asset(
              icon.sprite,
              color: color,
            ),
          ),
        ]),
      ),
    );
  }
}

class SpriteIcons {
  static const STAR_FILLED = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -20, offsetY: -2388);
  static const FOLDER_MOVE = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: 0, offsetY: -2024);
  static const CLOUD_CHECK = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: 0, offsetY: -1544);
  static const INSERT_COMMENT = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 24, width: 24, offsetX: 0, offsetY: -4678);

  static const UNDO = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -20, offsetY: -1938);
  static const REDO = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: 0, offsetY: -960);
  static const CUT = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -40, offsetY: -3320);
  static const COPY = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: 0, offsetY: -2962);
  static const PASTE = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -0, offsetY: -226);

  static const PRINT = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -20, offsetY: -3260);
  static const PAINT = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -20, offsetY: -2448);

  static const ADD_TO_DRIVE = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: 0, offsetY: -1000);
  static const TRASH = SpriteIconMetaData(SPRITE_SHEET_1,
      height: 18, width: 18, offsetX: -0, offsetY: -980);

  static const APP_SHARE = SpriteIconMetaData(SPRITE_SHEET_2,
      height: 20, width: 20, offsetX: 0, offsetY: -70);
}

class SpriteIconMetaData {
  final String sprite;
  final double height;
  final double width;
  final double offsetX;
  final double offsetY;
  const SpriteIconMetaData(
    this.sprite, {
    this.height,
    this.width,
    this.offsetX,
    this.offsetY,
  });
}
