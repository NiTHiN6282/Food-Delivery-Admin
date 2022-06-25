import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network("https://images.unsplash.com/photo-1611270629569-8b357cb88da9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
              title: Text("Pasta"),
              subtitle: Text("1000"),
              trailing: Icon(Icons.delete),
            ),
          );
        },),
      ),
    );
  }
}
