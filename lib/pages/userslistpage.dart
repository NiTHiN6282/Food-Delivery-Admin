import 'package:flutter/material.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text("${index + 1}"),
                title: Text("Akhil"),
                subtitle: Text("1234567890"),
                trailing: Icon(Icons.call),
              ),
            );
          },
        ),
      ),
    );
  }
}
