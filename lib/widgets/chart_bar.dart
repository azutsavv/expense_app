import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class chartbar extends StatelessWidget {
  final String lable;
  final double spending_amt;
  final double spending_percentage_amount;

  const chartbar(
      {required this.lable,
      required this.spending_amt,
      this.spending_percentage_amount = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      
      return Column(
        children: [
          Container(
              height: constraint.maxHeight*0.15,
               child: FittedBox(child: Text("\$${spending_amt.toStringAsFixed(0)}"))
               ),
          SizedBox(
            height:constraint.maxHeight*0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spending_percentage_amount.toDouble(),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight*0.05,
          ),
          Container
          (
            height: constraint.maxHeight*0.15,
            child:
             FittedBox(
              child: Text(lable)))
        ],
      );
    });
  }
}
