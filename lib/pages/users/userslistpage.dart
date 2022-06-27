import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/data.dart';
import 'package:fooddeliveryadmin/pages/users/user_details.dart';

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
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetails(
                        address: userList[index]['address'],
                        name: userList[index]['name'],
                        phone: userList[index]['phone'],
                      ),
                    ));
              },
              child: Card(
                child: ListTile(
                  leading: Text("${index + 1}"),
                  title: Text(userList[index]['name']),
                  subtitle: Text(userList[index]['phone'].toString()),
                  trailing: Icon(Icons.call),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
