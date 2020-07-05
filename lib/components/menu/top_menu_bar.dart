import 'package:flutter/material.dart';
import 'package:gsheet_app/components/sprite_icon.dart';
import 'package:gsheet_app/constants.dart' as Constants;

import 'menu_item.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      MenuButton(key: LabeledGlobalKey("File"), title: Text("File"), children: [
        MenuItem(
          title: Text("Share"),
        ),
        MenuItemDivider(),
        MenuItem.subMenu(
          title: Text("New"),
          subMenuItems: [MenuItem()],
        ),
        MenuItem.shortcut(
          title: Text("New"),
          shortcut: "⌘O",
        ),
        MenuItem(
          title: Text("Import"),
        ),
        MenuItem(
          title: Text("Make a copy"),
        ),
        MenuItemDivider(),
        MenuItem.subMenu(
          title: Text("Download"),
          subMenuItems: [MenuItem()],
        ),
        MenuItem(
          title: Text("Email as attachment"),
        ),
        MenuItem(
          title: Text("Make available office"),
        ),
        MenuItem.subMenu(
          title: Text("Version history"),
          subMenuItems: [MenuItem()],
        ),
        MenuItemDivider(),
        MenuItem(
          title: Text("Rename"),
        ),
        MenuItem(
          icon: SpriteIcon(icon: SpriteIcons.FOLDER_MOVE),
          title: Text("Move"),
        ),
        MenuItem(
          icon: SpriteIcon(icon: SpriteIcons.ADD_TO_DRIVE),
          title: Text("Add shortcut to Drive"),
        ),
        MenuItem(
          icon: SpriteIcon(icon: SpriteIcons.TRASH),
          title: Text("Move to trash"),
        ),
        MenuItemDivider(),
        MenuItem(
          title: Text("Publish to the web"),
        ),
        MenuItem(
          title: Text("Email collaborators"),
        ),
        MenuItemDivider(),
        MenuItem(
          title: Text("Document details"),
        ),
        MenuItem(
          title: Text("Spreadsheet settings"),
        ),
        MenuItem.shortcut(
          icon: SpriteIcon(icon: SpriteIcons.PRINT),
          title: Text("Print"),
          shortcut: "⌘P",
        ),
      ]),
      MenuButton(
        key: LabeledGlobalKey("Edit"),
        title: Text("Edit"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("View"),
        title: Text("View"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Insert"),
        title: Text("Insert"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Format"),
        title: Text("Format"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Data"),
        title: Text("Data"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Tools"),
        title: Text("Tools"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("ons"),
        title: Text("Add-ons"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Help"),
        title: Text("Help"),
        children: [
          MenuItem(
            title: Text("A"),
          ),
        ],
      ),
    ]);
  }
}
