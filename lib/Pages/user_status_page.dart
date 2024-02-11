import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:plypicker_flutter/Provider/user_status_provider.dart';

class UserStatusPage extends StatefulWidget {
  final String userName;

  const UserStatusPage({required this.userName});

  @override
  _UserStatusPageState createState() => _UserStatusPageState();
}

class _UserStatusPageState extends State<UserStatusPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserStatusProvider>().fetchUserStatus(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Problem'),
      ),
      body: Consumer<UserStatusProvider>(
        builder: (context, provider, child) {
          final userStatusSet = provider.userStatus.toSet();

          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userStatusSet.isNotEmpty) {
            return ListView.builder(
              itemCount: userStatusSet.length,
              itemBuilder: (context, index) {
                final userStatus = userStatusSet.elementAt(index);
                final problemName = userStatus.problem.name;
                final tags = userStatus.problem.tags;
                final verdict = userStatus.verdict;

                return Card(
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Problem: $problemName',
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Status :",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              verdict,
                              style: TextStyle(
                                fontSize: 15,
                                color: (verdict=="OK")?Colors.green:Colors.red,
                              ),
                            )
                          ],
                        ),
                        if (tags.isNotEmpty)
                          SizedBox(
                            height: 150,
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 2,
                                centerSpaceRadius: 20,
                                sections: List.generate(
                                  tags.length,
                                  (i) => PieChartSectionData(
                                    color: getColor(i),
                                    value: 1,
                                    title: tags[i],
                                    titleStyle: const TextStyle(fontSize: 12),
                                    radius: 50,
                                  ),
                                ),
                              ),
                            ),
                          )
                        else
                          Container(),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No user status available'),
            );
          }
        },
      ),
    );
  }

  Color getColor(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];

    return colors[index % colors.length];
  }
}
