// Import necessary packages
import 'package:flutter/material.dart';
import 'package:plypicker_flutter/Provider/user_provide.dart';
import 'package:provider/provider.dart';
import 'user_status_page.dart'; 

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UserPageState();
}

class _UserPageState extends State<UsersPage> {
  bool _isLoading = false;
  String user = "";
  final TextEditingController _userNameController = TextEditingController();

  Widget userDetailsTile(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$title : ",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Enter Codeforces Username',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  final userName = _userNameController.text.trim();
                  if (userName.isNotEmpty) {
                    user = await context
                        .read<UserInfoProvider>()
                        .fetchUserInfo(userName);
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Search'),
              ),
              const SizedBox(height: 16),
              Consumer<UserInfoProvider>(
                builder: (context, provider, child) {
                  final userDetails = provider.userDetails;
                  if (userDetails != null) {
                    if (user == "user Found") {
                      return Card(
                        elevation: 8,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'User Details',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: ClipRect(
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    userDetails.titlePhoto,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              userDetailsTile("Handle",userDetails.handle),
                              const Divider(thickness: 1,),
                              userDetailsTile("Rating",userDetails.rating.toString()),
                              const Divider(thickness: 1,),
                              userDetailsTile("Rank",userDetails.rank),
                              const Divider(thickness: 1,),
                              userDetailsTile("Contribution",userDetails.contribution.toString()),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserStatusPage(userName: _userNameController.text.trim(),),
                                    ),
                                  );
                                },
                                child: const Text('View User problems'),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "No User Found with username ${_userNameController.text.trim()}",
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
