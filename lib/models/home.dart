import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';

class homepage extends StatelessWidget {
  homepage({super.key});
  final List<Transaction> transactions = [
   
  ];

  // String ?title;
  // String ?amount;

  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    color: Colors.amber,
                    child: Text("card view")),
              ),
             
            ]  
        ),
      ),
      )
    );
  }
}
