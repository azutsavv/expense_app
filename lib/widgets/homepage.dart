import 'dart:io';

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
  bool _show_chart = false;
  @override
  Widget build(BuildContext context) {
    final orientaion =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: Text('Expense Manager'),
      actions: [
        IconButton(
            onPressed: () => _addnew_transaction(context),
            icon: Icon(Icons.add))
      ],
    );
    final trans_widget = Container(
        // transaction list widget//
        // height: (MediaQuery.of(context).size.height -
        //         appbar.preferredSize.height -
        //         MediaQuery.of(context).padding.top) *
        //     0.6,
        height: 600,
        child: SingleChildScrollView(
            child: transaction_list(_usertransaction, _deletetrnx)));
       return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.grey.shade900,
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (orientaion)
                  
                    
                    Switch.adaptive(
                      // new way added to flutter in 2.2.2 we can use if function to check the condition without using paraenthesis {} if contditon holds true then it will be executed otherwise no
                      value: _show_chart,
                      onChanged: (value) {
                        setState(() {
                          _show_chart = value;
                        });
                      },
                    ),
                  
              ],
            ),
            if (!orientaion)
              SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          appbar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.4,
                  child: Chart(_usertransaction)),
            if (!orientaion) trans_widget,
            if (orientaion)
              _show_chart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appbar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.4,
                      child: Chart(_usertransaction))
                  : trans_widget
          ]),
        ),
      ),
      floatingActionButton: Platform.isIOS ? Container(): FloatingActionButton(
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
