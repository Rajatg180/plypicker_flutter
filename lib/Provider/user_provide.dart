import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plypicker_flutter/Model/user_model.dart';
import 'package:http/http.dart' as http;

class UserInfoProvider extends ChangeNotifier {
  
  UserModel? _userDetails;

  UserModel? get userDetails => _userDetails;

  Future<String> fetchUserInfo(String userName) async {

    final response = await http.get(
      Uri.parse('https://codeforces.com/api/user.info?handles=$userName'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final List<dynamic> result = data['result'];

        if (result.isNotEmpty) {
          final userInfo = result[0];
          _userDetails = UserModel(
            contribution: userInfo['contribution'] ?? 0,
            lastOnlineTimeSeconds: userInfo['lastOnlineTimeSeconds'] ?? 0,
            rating: userInfo['rating'] ?? 0,
            friendOfCount: userInfo['friendOfCount'] ?? 0,
            titlePhoto: userInfo['titlePhoto'] ?? '',
            rank: userInfo['rank'] ?? '',
            handle: userInfo['handle'] ?? '',
            maxRating: userInfo['maxRating'] ?? 0,
            avatar: userInfo['avatar'] ?? '',
            registrationTimeSeconds: userInfo['registrationTimeSeconds'] ?? 0,
            maxRank: userInfo['maxRank'] ?? '',
          );

          notifyListeners();
          return "user Found";
        } else {
          return "No user found";
        }
      } else {
        return "No user found";
      }
    } else {
      return "No user found";
    }
  }
}

