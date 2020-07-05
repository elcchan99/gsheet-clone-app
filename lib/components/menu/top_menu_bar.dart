import 'package:flutter/material.dart';
import 'package:gsheet_app/components/sprite_icon.dart';
import 'package:gsheet_app/constants.dart' as Constants;

import 'menu_item.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    Key key,
  }) : super(key: key);

  final TextStyle shorcutTextStyle =
      const TextStyle(fontSize: 18, color: Constants.SHORTCUT_COLOR);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      MenuButton(key: LabeledGlobalKey("File"), title: Text("File"), children: [
        ListTile(
          dense: true,
          title: Text("Share"),
        ),
        MenuItemDivider(),
        ListTile(
          dense: true,
          title: Text("New"),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
            dense: true,
            title: Text("New"),
            trailing: Text(
              "⌘O",
              style: shorcutTextStyle,
            )),
        ListTile(
          dense: true,
          title: Text("Import"),
        ),
        ListTile(
          dense: true,
          title: Text("Make a copy"),
        ),
        MenuItemDivider(),
        ListTile(
          dense: true,
          title: Text("Download"),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          dense: true,
          title: Text("Email as attachment"),
        ),
        ListTile(
          dense: true,
          title: Text("Make available office"),
        ),
        ListTile(
          dense: true,
          title: Text("Version history"),
          trailing: Icon(Icons.arrow_right),
        ),
        MenuItemDivider(),
        ListTile(
          dense: true,
          title: Text("Rename"),
        ),
        // ListTile(
        //   dense: true,
        //   leading: SpriteIcon(icon: SpriteIcons.FOLDER_MOVE),
        //   title: Text("Move"),
        // ),
        // ListTile(
        //   dense: true,
        //   leading: SpriteIcon(icon: SpriteIcons.ADD_TO_DRIVE),
        //   title: Text("Add shortcut to Drive"),
        // ),
        // ListTile(
        //   dense: true,
        //   leading: SpriteIcon(icon: SpriteIcons.TRASH),
        //   title: Text("Move to trash"),
        // ),
        // MenuItemDivider(),
        // ListTile(
        //   dense: true,
        //   title: Text("Publish to the web"),
        // ),
        // ListTile(
        //   dense: true,
        //   title: Text("Email collaborators"),
        // ),
        // MenuItemDivider(),
        // ListTile(
        //   dense: true,
        //   title: Text("Document details"),
        // ),
        // ListTile(
        //   dense: true,
        //   title: Text("Spreadsheet settings"),
        // ),
        // ListTile(
        //   dense: true,
        //   leading: SpriteIcon(icon: SpriteIcons.PRINT),
        //   title: Text("Print"),
        //   trailing: Text("⌘P", style: shorcutTextStyle),
        // ),
      ]),
      MenuButton(
        key: LabeledGlobalKey("Edit"),
        title: Text("Edit"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("View"),
        title: Text("View"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Insert"),
        title: Text("Insert"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Format"),
        title: Text("Format"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Data"),
        title: Text("Data"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Tools"),
        title: Text("Tools"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("ons"),
        title: Text("Add-ons"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
      MenuButton(
        key: LabeledGlobalKey("Help"),
        title: Text("Help"),
        children: [
          ListTile(
            dense: true,
            title: Text("A"),
          ),
        ],
      ),
    ]);
  }
}
