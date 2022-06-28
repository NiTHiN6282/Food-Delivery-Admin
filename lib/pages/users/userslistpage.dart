import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("user")
                .where("usertype", isEqualTo: "user")
                .snapshots(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(
                              address: snapshot.data!.docs[index]['address'],
                              name: snapshot.data!.docs[index]['name'],
                              phone: snapshot.data!.docs[index]['phone'],
                            ),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(
                          snapshot.data!.docs[index]['name'],
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[index]['phone'],
                        ),
                        trailing: Icon(Icons.call),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
