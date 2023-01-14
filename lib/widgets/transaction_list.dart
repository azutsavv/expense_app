import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class transaction_list extends StatelessWidget {
  final List<Transaction> transaction;
  transaction_list(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          itemCount: transaction.length,
          itemBuilder: (context, index) {
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
                          border: Border.all(width: 2, color: Colors.black)),
                      child: Text(
                        '\$ ${transaction[index].amount}',
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
                            transaction[index].title,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(DateFormat('dd-MM-yyyy')
                              .format(transaction[index].date))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
