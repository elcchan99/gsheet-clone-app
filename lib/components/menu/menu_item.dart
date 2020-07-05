import 'package:flutter/material.dart';
import 'package:gsheet_app/components/sprite_icon.dart';
import 'dart:math';

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
        elevation: 0,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: widget.title,
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
                height: size.height - _buttonPosition.dy - _buttonSize.height,
                width: 300,
                child: Column(
                  children: [
                    Material(
                        elevation: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: widget.children,
                          ),
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              onClose();
                            },
                            child: Container(color: Colors.pink)))
                  ],
                )),
          ],
        );
      },
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
