import 'package:calendar_do_an/pages/base/controller/base_controller.dart';
import 'package:get/get.dart';
class JobController extends BaseController{
  List<bool> listCheck = [];

  void clickCheck(bool valueCheck,int index){
    listCheck[index] = valueCheck;
    refreshScreen();
  }
  @override
  Future<void> onInitData() async {
    for(int i=0;i<4;i++){
      listCheck.add(false);
    }
  }

}