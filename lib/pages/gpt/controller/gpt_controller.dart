import 'dart:async';

import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:calendar_do_an/untils/log/log_util.dart';
import 'package:calendar_do_an/widget/chatmessage_widget.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';

class GptController extends BaseController {
  ChatGPT? chatGPT;
  final TextEditingController controller1 = TextEditingController();
  List<ChatMessage> messages1 = [];
  bool isImageSearch = false;
  StreamSubscription? _subscription;
  bool isTyping = false;

  @override
  void dispose() {
    chatGPT!.genImgClose();
    _subscription?.cancel();
    super.dispose();
  }

  void sendMessage() {
    List<String> dataMess = [];
    if (controller1.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: controller1.text,
      sender: "user",
      isImage: false,
    );

    messages1.insert(0, message);
    isTyping = true;
    refreshScreen();
    controller1.clear();

    if (isImageSearch) {
      final request = GenerateImage(message.text, 1, size: "256x256");

      _subscription = chatGPT!
          .generateImageStream(request)
          .asBroadcastStream()
          .listen((response) {
        Log().i(response.data!.last!.url!);
        insertNewData(response.data!.last!.url!, isImage: true);
      });
    } else {
      final request = CompleteReq(
          prompt: message.text, model: kTranslateModelV3, max_tokens: 200);

      _subscription = chatGPT!
          .onCompleteStream(request: request)
          .asBroadcastStream()
          .listen((response) {
            dataMess.add(response!.choices[0].text);
            if(dataMess.length>=2){
              dataMess.removeAt(0);
            }
            else
              {
                Log().e(dataMess[0]);
                 insertNewData(dataMess[0], isImage: false);
              }

      });
    }
  }

  /// thêm tin nhắn từ bot vào
  ///[response] tìn nhắn từ message gửi về
  void insertNewData(String response, {bool isImage = false}) {
        ChatMessage botMesage = ChatMessage(
            text: response, sender: "GPT", isImage: isImage);
        refreshScreen();
        isTyping = false;
        refreshScreen();
        messages1.insert(0, botMesage);

  }

  @override
  Future<void> onInitData() async {
    chatGPT = ChatGPT.instance.builder(
      "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",
    );
    Log().e(chatGPT.toString());
  }
}
