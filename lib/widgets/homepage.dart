import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/chart.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
  final List<Transaction> _usertransaction = [];

  List<Transaction> get _recenttransaction {
    return _usertransaction.where(
      (element) {
        return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      },
    ).toList();
  }
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Expense Manager'),
        actions: [
          IconButton(
              onPressed: () => _addnew_transaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Chart(_usertransaction),
            SingleChildScrollView(child: transaction_list(_usertransaction,_deletetrnx))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addnew_transaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }

  final List<Transaction> _usertransaction = [];

  void _addTransaction(String ttle, double amt) {
    final newtxt = Transaction(
        title: ttle,
        amount: amt,
        id: DateTime.now().toString(),
        date: DateTime.now());

    setState(() {
      _usertransaction.add(newtxt);
    });
    ;
  }

  void _addnew_transaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: ((_) {
          return new_transaction(addtx: _addTransaction);
        }));
  }

  void _deletetrnx(String id) {
    setState(() {
      return _usertransaction.removeWhere((element) => element.id == id);
    });
  }
}
