import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  dynamic url;
  dynamic foodid;
  File? imageFile;
  bool recommend = false;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemRatingController = TextEditingController();
  TextEditingController itemDescController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  final _addproductFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    foodid = DateTime.now().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Form(
                  key: _addproductFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Add Item"),
                      ),
                      SizedBox(
                        height: scrHei / 15,
                      ),
                      Container(
                        width: scrWid / 1.3,
                        height: scrHei / 15,
                        child: TextFormField(
                          controller: itemNameController,
                          decoration: InputDecoration(
                              hintText: "Item Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      Container(
                        width: scrWid / 1.3,
                        height: scrHei / 15,
                        child: TextFormField(
                          controller: itemDescController,
                          decoration: InputDecoration(
                              hintText: "Item Description",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      Container(
                        width: scrWid / 1.3,
                        height: scrHei / 15,
                        child: TextFormField(
                          controller: itemPriceController,
                          decoration: InputDecoration(
                            hintText: "Item Price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      Container(
                        width: scrWid / 1.3,
                        height: scrHei / 15,
                        child: TextFormField(
                          controller: itemRatingController,
                          decoration: InputDecoration(
                              hintText: "Item Rating",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      InkWell(
                        onTap: () async {
                          XFile? pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              imageFile = File(pickedFile.path);
                            });
                          }
                        },
                        child: imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: scrWid / 2,
                                  height: scrHei / 5,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[100],
                                  ),
                                  child: Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: scrWid / 2,
                                height: scrHei / 13,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image),
                                    SizedBox(
                                      width: scrWid / 18,
                                    ),
                                    Text("Add Image"),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: null,
                          builder: (context, snapshot) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Recommended :"),
                                CupertinoSwitch(
                                    dragStartBehavior: DragStartBehavior.start,
                                    value: recommend,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value == false) {
                                          recommend = value;
                                        } else {
                                          recommend = value;
                                        }
                                      });
                                    }),
                              ],
                            );
                          }),
                      SizedBox(
                        height: scrHei / 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Add Clicked");
                          if (imageFile == null) {
                            showsnackbar("Add  image");
                          } else if (_addproductFormKey.currentState!
                              .validate()) {
                            String fileName = DateTime.now().toString();

                            var ref = FirebaseStorage.instance
                                .ref()
                                .child('foods/$fileName');

                            UploadTask uploadTask =
                                ref.putFile(File(imageFile!.path));
                            uploadTask.then((res) async {
                              url = (await ref.getDownloadURL()).toString();
                            }).then((value) => FirebaseFirestore.instance
                                    .collection('foods')
                                    .doc(foodid)
                                    .set({
                                  "recommended": recommend,
                                  "name": itemNameController.text,
                                  "description": itemDescController.text,
                                  "price": itemPriceController.text,
                                  "image": url,
                                  "foodid": foodid,
                                  "fileName": fileName,
                                  "rating": itemRatingController.text,
                                  "status": 1,
                                  "date": DateTime.now().toString(),
                                }).then((value) {
                                  showsnackbar("Product Added Successfully");
                                  Navigator.pop(context);
                                }));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: scrWid / 2,
                          height: scrHei / 13,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: scrWid / 18,
                              ),
                              Text("Add Item"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
