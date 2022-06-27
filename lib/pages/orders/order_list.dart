import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/data.dart';
import 'package:fooddeliveryadmin/pages/orders/order_details.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: scrWid,
        height: scrHei,
        child: Column(
          children: [
            SizedBox(
              height: scrHei / 30,
            ),
            Text("Orders"),
            SizedBox(
              height: scrHei / 50,
            ),
            Container(
              // color: Colors.red,
              width: scrWid,
              height: scrHei / 1.13,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetails(
                                  img: orderList[index]['img'],
                                  address: orderList[index]['address'],
                                  loc: orderList[index]['location'],
                                  email: orderList[index]['email'],
                                  name: orderList[index]['name'],
                                  phone: orderList[index]['phone'],
                                  price: orderList[index]['price'],
                                  user: orderList[index]['user'],
                                ),
                              ));
                        },
                        child: Container(
                          height: scrHei / 10,
                          width: scrWid / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Image.network(
                                orderList[index]['img'],
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orderList[index]['name'],
                                  ),
                                  Text(
                                    orderList[index]['price'].toString(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
