import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';
import '../models/transaction.dart';
import 'new_transaction.dart';

class user_transaction extends StatefulWidget {
  const user_transaction({super.key});

  @override
  State<user_transaction> createState() => _user_transactionState();
}

class _user_transactionState extends State<user_transaction> {
  final List<Transaction> _usertransaction = [
    Transaction(amount: 50, date: DateTime.now(), id: 't1', title: 'samosa'),
    Transaction(amount: 10, date: DateTime.now(), id: 't2', title: 'rickshaw'),
    Transaction(amount: 200, date: DateTime.now(), id: 't3', title: 'dinner'),
    Transaction(amount: 30, date: DateTime.now(), id: 't4', title: 'Breakfast'),
  ];

  void _addTransaction(String ttle, double amt) {
    final newtxt = Transaction(
        title: ttle,
        amount: amt,
        id: DateTime.now().toString(),
        date: DateTime.now());

    setState(() {
      _usertransaction.add(newtxt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new_transaction(addtx:_addTransaction,),
        transaction_list(_usertransaction),
      ],
    );
  }
}
