import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/data.dart';
import 'package:fooddeliveryadmin/pages/food/food_details.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('foods').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No Foods Found"),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetails(
                                desc: snapshot.data!.docs[index]['description'],
                                img: snapshot.data!.docs[index]['image'],
                                name: snapshot.data!.docs[index]['name'],
                                price: snapshot.data!.docs[index]['price'],
                                foodid: snapshot.data!.docs[index]['foodid'],
                                rating: snapshot.data!.docs[index]['rating'],
                              ),
                            ));
                        print(snapshot.data!.docs[index]['rating']);
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.network(
                            snapshot.data!.docs[index]['image'],
                            width: scrWid / 5,
                            height: scrHei / 12,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            snapshot.data!.docs[index]['name'],
                          ),
                          subtitle: Text(
                              snapshot.data!.docs[index]['price'].toString()),
                          trailing: InkWell(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('foods')
                                    .doc(snapshot.data!.docs[index]['foodid'])
                                    .delete()
                                    .then((value) => showsnackbar("Removed"));
                                FirebaseStorage.instance
                                    .ref()
                                    .child(
                                        'foods/${snapshot.data!.docs[index]['fileName']}')
                                    .delete();
                              },
                              child: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }

  showsnackbar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
