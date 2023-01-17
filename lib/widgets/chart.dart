import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttransaction;
  Chart(this.recenttransaction);

  List<Map<String, Object>> get groupedvaluetransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalamount = 0.0;

      for (var i = 0; i < recenttransaction.length; i++) {
        if (recenttransaction[i].date.day == weekday.day &&
            recenttransaction[i].date.month == weekday.month &&
            recenttransaction[i].date.year == weekday.year) {
          totalamount += recenttransaction[i].amount;
        }
      }

      print(DateFormat.E(weekday));
      print(totalamount);
      return {'day': DateFormat.E(weekday), 'amount': totalamount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(2),
      child: Row(children: []),
    );
  }
}
