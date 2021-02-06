import 'package:flutter/material.dart';
import 'package:supply/widget/bar/base_app_bar.dart';
import 'package:supply/widget/bar/simple_app_bar.dart';

///
class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget: SimpleAppBar(title: '设置')),
      body: Center(child: Text('Settings')),
    );
  }
}
