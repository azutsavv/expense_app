import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class new_transaction extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
   new_transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      TextField(
                        autocorrect: true,
                        decoration: InputDecoration(labelText: 'title'),
                        controller: titlecontroller,
                        // onChanged: (value) {
                        //   title = value;
                          
                        // },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'amount'),
                        //onChanged: (value) => amount = value,
                        controller: amountcontroller,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 10, backgroundColor: Colors.amber),
                          onPressed: (() {
                            print(titlecontroller);
                            print(amountcontroller);
                          }),
                          child: Text(
                            'Add Tx',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              );
  }
}