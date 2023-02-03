import 'package:calendar_do_an/pages/base/view/base_screen.dart';
import 'package:calendar_do_an/pages/gpt/controller/gpt_controller.dart';
import 'package:calendar_do_an/pages/gpt/view/appbar_child.dart';
import 'package:calendar_do_an/pages/gpt/view/message.dart';
import 'package:calendar_do_an/pages/gpt/view/threedot.dart';
import 'package:calendar_do_an/resources/style/color.dart';
import 'package:calendar_do_an/widget/chatmessage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class GptScreen extends BaseScreen<GptController>
{
  @override
  Widget getView() {
    return Column(
      children: [
        appBar(),
        Container(
          decoration: BoxDecoration(
            color: AppColor.white,
          ),
          child: buildTextComposer(),
        ),
        message(),
        controller.isTyping==true?ThreeDotsState():Container()
      ],
    );
  }

}