// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContestTile extends StatelessWidget {
  
  int contestId;
  String contestName;
  String contestTime;

  ContestTile(
      {super.key,
      required this.contestId,
      required this.contestName,
      required this.contestTime});

      
  // _launchURL(int id) async{
  //   print("ok");
  //     // String url="https://codeforces.com/contest/" + id.toString();
  //     // String url="https://codeforces.com/api/contest.ratingChanges?contestId=${id.toString()}";
  //     String url = "https://codeforces.com/contest/$id";
  //     if( await canLaunch(url)){
  //       await launch(url);
  //     }
  //     else
  //     {
  //       throw 'Could not launch $url';
  //     }
  // }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _launchURL(contestId);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            contestName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            contestTime,
          ),
        ),
      ),
    );
  }
}
