import 'package:flutter/material.dart';
import 'package:plypicker_flutter/Widgets/contest_tile.dart';
import 'package:plypicker_flutter/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:plypicker_flutter/Provider/contest_provider.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {

    // Fetch contests when the screen is built
    context.read<ContestProvider>().fetchUpComingContests();

    return Scaffold(
      body: Consumer<ContestProvider>(
        builder: (context, provider, _) {

          // showing progress indicator until contest get load 
          if (provider.contestsUp.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          // Sort contests by start time
          provider.contestsUp.sort(
            (a, b) => a.startTimeSeconds.compareTo(b.startTimeSeconds),
          );

          return ListView.builder(
            itemCount: provider.contestsUp.length,
            itemBuilder: (context, index) {
              final contest = provider.contestsUp[index];
              return ContestTile(contestId: contest.id ,contestName: contest.name, contestTime: startTime(contest.startTimeSeconds));
            },
          );
        },
      ),
    );
  }
}
