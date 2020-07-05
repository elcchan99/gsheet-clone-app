import 'package:flutter/material.dart';
import 'package:gsheet_app/components/sprite_icon.dart';
import 'dart:math';
import 'package:gsheet_app/constants.dart' as Constants;

class MenuButton extends StatefulWidget {
  const MenuButton({
    GlobalKey key,
    this.title,
    this.children,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  GlobalKey get actionKey {
    return widget.key as GlobalKey;
  }

  bool isActive = false;
  Size _buttonSize;
  Offset _buttonPosition;
  OverlayEntry _dropDownMenu;

  void onOpen() {
    RenderBox renderBox = actionKey.currentState.context.findRenderObject();
    _buttonSize = renderBox.size;
    _buttonPosition = renderBox.localToGlobal(Offset.zero);

    _dropDownMenu = _buildDropDownMenu();
    Overlay.of(context).insert(_dropDownMenu);

    setState(() {
      isActive = !isActive;
    });
  }

  void onClose() {
    _dropDownMenu.remove();
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, top: 2),
      child: RawMaterialButton(
        constraints: BoxConstraints(),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: widget.title,
        hoverColor: Constants.MENU_HOVER_COLOR,
        fillColor: isActive ? Constants.MENU_ACTIVE_COLOR : null,
        focusColor: isActive ? Constants.MENU_FOCUS_COLOR : null,
        onPressed: () {
          isActive ? onClose() : onOpen();
        },
      ),
    );
  }

  OverlayEntry _buildDropDownMenu() {
    return OverlayEntry(
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                onClose();
              },
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.transparent,
              ),
            ),
            Positioned(
                top: _buttonPosition.dy + _buttonSize.height,
                left: _buttonPosition.dx,
                child: LimitedBox(
                  maxHeight:
                      size.height - _buttonPosition.dy - _buttonSize.height,
                  maxWidth: size.width - _buttonPosition.dx,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Material(
                            elevation: 2,
                            child: SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: widget.children
                                    .map((e) => Flexible(flex: 1, child: e))
                                    .toList(),
                              ),
                            )),
                      ),
                      Expanded(
                          child: GestureDetector(
                              onTap: onClose,
                              child: Container(color: Colors.transparent)))
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}

class MenuItem extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final Widget shortcut;
  final List<MenuItem> subMenuItems;

  static const TextStyle shortcutTextStyle =
      const TextStyle(fontSize: 18, color: Constants.SHORTCUT_COLOR);

  const MenuItem(
      {Key key,
      this.icon,
      this.title,
      this.shortcut,
      this.subMenuItems = const []})
      : super(key: key);

  factory MenuItem.shortcut(
      {Key key, Widget icon, Widget title, String shortcut}) {
    return MenuItem(
      key: key,
      icon: icon,
      title: title,
      shortcut: Text(
        shortcut,
        style: shortcutTextStyle,
      ),
    );
  }

  factory MenuItem.subMenu(
      {Key key, Widget icon, Widget title, List<MenuItem> subMenuItems}) {
    return MenuItem(
      key: key,
      icon: icon,
      title: title,
      subMenuItems: subMenuItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Constants.MENU_HOVER_COLOR,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 1,
            child: SizedBox(height: 18, width: 18, child: icon),
          ),
          Expanded(flex: 5, child: title),
          Expanded(
              flex: 1,
              child: shortcut ??
                  (subMenuItems.isEmpty
                      ? Container()
                      : Icon(Icons.arrow_right))),
          Container()
        ]),
      ),
    );
  }
}

class MenuItemDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}
