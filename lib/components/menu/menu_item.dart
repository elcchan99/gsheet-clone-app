import 'package:flutter/material.dart';
import 'package:gsheet_app/components/sprite_icon.dart';
import 'dart:math';

class MenuButton extends StatefulWidget {
  const MenuButton({
    GlobalKey key,
    this.isActive = false,
    this.title,
    this.children,
  }) : super(key: key);

  final bool isActive;
  final Widget title;
  final List<Widget> children;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  GlobalKey get actionKey {
    return widget.key as GlobalKey;
  }

  bool isActive;
  double _height, _width;
  double _xPosition, _yPosition;
  OverlayEntry _dropDownMenu;

  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  void onOpen() {
    RenderBox renderBox = actionKey.currentState.context.findRenderObject();
    _height = renderBox.size.height;
    _width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    _xPosition = offset.dx;
    _yPosition = offset.dy;

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
                top: _yPosition + _height,
                left: _xPosition,
                height: size.height - _yPosition - _height,
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
