import 'package:calendar_do_an/pages/base/view/base_screen.dart';
import 'package:calendar_do_an/pages/jobdone/controller/jobdone_controller.dart';
import 'package:calendar_do_an/pages/jobdone/view/appbar_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class JobDoneScreen extends BaseScreen<JobDoneController>{
  @override
  Widget getView() {
    return Column(
      children: [
        appBar(),
      ],
    );
  }

}