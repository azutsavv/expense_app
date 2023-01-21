import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/chart_bar.dart';

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

      print(DateFormat.E().format(weekday));
      print(totalamount);
      return {'day': DateFormat.E().format(weekday), 'amount': totalamount};
    }).reversed.toList();
  }

  double get spending_total {
    return groupedvaluetransaction.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedvaluetransaction);
    return Card(
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedvaluetransaction.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                
                child: chartbar(
                  spending_percentage_amount: 0.0.isFinite?0.0: // still an error return type is double but widget take bool value
                      ((data['amount'] as double) / spending_total),
                  spending_amt: data['amount'] as double,
                  lable: data['day'].toString(),
                ),
              );
            }).toList(),
          ),
        ));
  }
}

