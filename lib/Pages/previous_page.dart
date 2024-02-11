import 'package:flutter/material.dart';
import 'package:plypicker_flutter/Provider/contest_provider.dart';
import 'package:plypicker_flutter/Widgets/contest_tile.dart';
import 'package:plypicker_flutter/shared/constants.dart';
import 'package:provider/provider.dart';

class PreviousPage extends StatefulWidget {
  const PreviousPage({super.key});

  @override
  State<PreviousPage> createState() => _PreviousPageState();
}

class _PreviousPageState extends State<PreviousPage> {
  @override
  Widget build(BuildContext context) {

    context.read<ContestProvider>().fetchUpComingContests();

    return Scaffold(
      body: Consumer<ContestProvider>(
        builder: (context, provider, _) {


          if (provider.contestsFi.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.contestsFi.length,
            itemBuilder: (context, index) {
              final contest = provider.contestsFi[index];
              return ContestTile(contestId: contest.id ,contestName: contest.name, contestTime: startTime(contest.startTimeSeconds));
            },
          );
        },
      ),
    );
  }
}