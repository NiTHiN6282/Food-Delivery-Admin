import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  String name;
  String img;
  String price;
  String desc;
  String foodid;
  String rating;
  int itemIndex;

  FoodDetails({
    Key? key,
    required this.desc,
    required this.img,
    required this.name,
    required this.price,
    required this.foodid,
    required this.rating,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Details"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20),
          height: scrHei,
          width: scrWid,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(widget.name),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.img),
                ),
              ),
              Text("Item price : ${widget.price.toString()}"),
              SizedBox(
                height: 20,
              ),
              Text("Description: ${widget.desc.toString()}"),
              SizedBox(
                height: 20,
              ),
              Text("Rating: ${widget.rating.toString()}"),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('foods')
                            .doc(widget.foodid)
                            .update({"status": 0});
                      },
                      child: Icon(Icons.close_rounded)),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('foods')
                            .doc(widget.foodid)
                            .update({"status": 1});
                      },
                      child: Icon(Icons.done_rounded)),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('foods')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Recommend :"),
                          // ElevatedButton(
                          //     onPressed: () {
                          //       {
                          //         setState(() {
                          //           if (snapshot.data!.docs[widget.itemIndex]
                          //                   ['recommended'] ==
                          //               true) {
                          //             FirebaseFirestore.instance
                          //                 .collection("foods")
                          //                 .doc(widget.foodid)
                          //                 .update({"recommended": false});
                          //           } else {
                          //             FirebaseFirestore.instance
                          //                 .collection("foods")
                          //                 .doc(widget.foodid)
                          //                 .update({"recommended": true});
                          //           }
                          //         });
                          //       }
                          //     },
                          //     child: Text("recom")),
                          CupertinoSwitch(
                              dragStartBehavior: DragStartBehavior.start,
                              value: snapshot.data!.docs[widget.itemIndex]
                                  ['recommended'],
                              onChanged: (value) {
                                setState(() {
                                  if (value == false) {
                                    FirebaseFirestore.instance
                                        .collection("foods")
                                        .doc(widget.foodid)
                                        .update({"recommended": value});
                                  } else {
                                    FirebaseFirestore.instance
                                        .collection("foods")
                                        .doc(widget.foodid)
                                        .update({"recommended": value});
                                  }
                                });
                              }),
                        ],
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
