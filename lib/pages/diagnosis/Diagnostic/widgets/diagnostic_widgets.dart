import 'package:flutter/material.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Container(
        child: reusableText("Settings"),
      ),
    ),
  );
}
