import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plypicker_flutter/Model/contest_model.dart';

class ContestProvider extends ChangeNotifier {
  // storing the upcoming contest
  List<ContestModel> _contestsUp = [];

  List<ContestModel> get contestsUp => _contestsUp;

  // storing the finised contest
  List<ContestModel> _contestsFi = [];

  List<ContestModel> get contestsFi => _contestsFi;

  Future<void> fetchUpComingContests() async {
    final response = await http.get(Uri.parse('https://codeforces.com/api/contest.list'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'OK') {

        final List<dynamic> contestsData = data['result'];

        // fetch the upcoming contest 
        _contestsUp = contestsData
            .where((contest) => contest['phase'] == 'BEFORE')
            .map((contest) => ContestModel(
                  id: contest['id'],
                  name: contest['name'],
                  type: contest['type'],
                  phase: contest['phase'],
                  frozen: contest['frozen'],
                  durationSeconds: contest['durationSeconds'],
                  startTimeSeconds: contest['startTimeSeconds'],
                  relativeTimeSeconds: contest['relativeTimeSeconds'],
                ))
            .toList();

        // fetch the finished contest
        _contestsFi = contestsData
            .where((contest) => contest['phase'] == 'FINISHED')
            .map((contest) => ContestModel(
                  id: contest['id'],
                  name: contest['name'],
                  type: contest['type'],
                  phase: contest['phase'],
                  frozen: contest['frozen'],
                  durationSeconds: contest['durationSeconds'],
                  startTimeSeconds: contest['startTimeSeconds'],
                  relativeTimeSeconds: contest['relativeTimeSeconds'],
                ))
            .toList();


        notifyListeners();

      } else {
        throw Exception('Failed to fetch contests');
      }
    } else {
      throw Exception('Failed to fetch contests');
    }
  }
}
