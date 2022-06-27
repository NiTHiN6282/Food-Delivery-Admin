import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  late File imageFile;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: scrWid,
          height: scrHei,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Add Item"),
                ),
                SizedBox(
                  height: 50,
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
                  height: 50,
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
                  height: 50,
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
                  height: 50,
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
                      ? Container(
                          width: scrWid / 2,
                          height: scrHei / 5,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
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
                                width: 10,
                              ),
                              Text("Add Image"),
                            ],
                          ),
                        ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: scrWid / 2,
                  height: scrHei / 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Add Item"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
