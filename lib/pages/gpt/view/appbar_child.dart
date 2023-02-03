import 'package:calendar_do_an/generated/assets.dart';
import 'package:calendar_do_an/pages/gpt/view/gpt_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/appbar_widget.dart';

extension AppBar on GptScreen{

  Widget appBar() {
    return Builder(builder: (MainScreen){
      return AppBarWidget(
        title: 'CHAT GPT-BETA',
        onPressed: () {
          Scaffold.of(context).openDrawer();
        }, image: Assets.imagesIcons8Chatbot48,
      );
    });
  }
}