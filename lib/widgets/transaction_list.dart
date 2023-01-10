import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/transaction.dart';

class transacrion_list extends StatefulWidget {
  const transacrion_list({super.key});

  @override
  State<transacrion_list> createState() => _transacrion_listState();
}

class _transacrion_listState extends State<transacrion_list> {
  final List<Transaction> usertransaction = [
    Transaction(amount: 50, date: DateTime.now(), id: 't1', title: 'samosa'),
    Transaction(amount: 10, date: DateTime.now(), id: 't2', title: 'rickshaw'),
    Transaction(amount: 200, date: DateTime.now(), id: 't3', title: 'dinner'),
    Transaction(amount: 30, date: DateTime.now(), id: 't4', title: 'Breakfast'),
  ];
  
 
  @override
  Widget build(BuildContext context) {
    return Column(
                  children:usertransaction.map(
                (tx) {
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          Container(
                            // width: 40,
                            // height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            child: Text(
                              '\$ ${tx.amount}',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            //width: double.nan,
                            decoration: BoxDecoration(
                                // border: Border.all(width: 2 ,color: Colors.indigo)
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(DateFormat('dd-MM-yyyy').format(tx.date))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ).toList()
              );
            
  }
}
