import 'package:intl/intl.dart';

class Constants{
  static String appId="1:494438016572:web:920d2a5f782de7360e4539";
  static String apiKey="AIzaSyB1Tr4pTu9cnlUqSakN92DxMNa2jtgcz38";
  static String messagingSenderId="494438016572";
  static String projectId="plypicker-project-assi";
}

String startTime(int timestamp) {
    var format = DateFormat('EEE dMMMM y HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var time = format.format(date);
    return time;
  }