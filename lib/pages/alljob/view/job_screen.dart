import 'package:calendar_do_an/pages/alljob/controller/job_controller.dart';
import 'package:calendar_do_an/pages/alljob/view/appbar_child.dart';
import 'package:calendar_do_an/pages/alljob/view/list_job_child.dart';
import 'package:calendar_do_an/pages/base/view/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class JobScreen extends BaseScreen<JobController>{
  @override
  Widget getView() {
    return Column(
      children: [
        appBar(),
        listJob(),
      ],
    );
  }

}