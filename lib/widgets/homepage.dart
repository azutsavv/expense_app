import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import 'package:personal_expense_app/widgets/user_transaction.dart';

class homepage extends StatelessWidget {
  homepage({super.key});
  
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                SingleChildScrollView(child: user_transaction())
              
              ]  
          ),
              ),
        ),
      )
    );
  }
}
