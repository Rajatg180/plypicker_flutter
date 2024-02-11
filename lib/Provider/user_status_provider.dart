import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plypicker_flutter/Model/problem_model.dart';
import 'dart:convert';


class UserStatusProvider extends ChangeNotifier {
  bool isLoading=false;
  List<UserStatusDetails> _userStatus = [];

  List<UserStatusDetails> get userStatus => _userStatus;

  Future<void> fetchUserStatus(String handle) async {
    isLoading=true;
    final response = await http.get(
      Uri.parse('https://codeforces.com/api/user.status?handle=$handle&from=1&count=50'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final List<dynamic> userStatusList = data['result'];
        _userStatus = userStatusList
            .map((status) => UserStatusDetails.fromJson(status))
            .toList();
        
        isLoading=false;

        notifyListeners();
        
      }
      else{
        print("error fetching user data ");
      }
    }
  }
}

