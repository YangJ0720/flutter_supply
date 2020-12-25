import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:supply/config/view_config.dart';

///
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget widget;

  const BaseAppBar({Key key, this.widget}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return widget;
  }

  @override
  Size get preferredSize => Size.fromHeight(ViewConfig.APP_BAR_SIZE);
}