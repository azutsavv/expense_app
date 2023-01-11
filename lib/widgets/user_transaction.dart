import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import 'new_transaction.dart';

class user_transaction extends StatefulWidget {
  const user_transaction({super.key});

  @override
  State<user_transaction> createState() => _user_transactionState();
}

class _user_transactionState extends State<user_transaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         new_transaction(),
         transacrion_list()
      ],
    );
  }
}