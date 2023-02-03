import 'package:calendar_do_an/pages/gpt/view/gpt_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension Message on GptScreen {
  Widget message() {
    return Flexible(child: ListView.builder(
        reverse: true,
        padding: Vx.m8,
        itemCount: controller.messages1.length,
        itemBuilder: (context, index) {
      return  controller.messages1[index];
    }));
  }

  Widget buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.controller1,
            onSubmitted: (value) => controller.sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Đặt câu hỏi"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                controller.isImageSearch = false;
                controller.sendMessage();
              },
            ),
          ],
        ),
      ],
    ).px16();
  }
}
