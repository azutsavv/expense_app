import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class transaction_list extends StatelessWidget {
  
  final List<Transaction> transaction;
  final Function deletetx;
  transaction_list(this.transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    final orienttation = MediaQuery.of(context).orientation == Orientation.landscape;
     return
    transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                const Text(
                  'no transaction yet',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
            :Container(
              height: 600,
              child: ListView.builder(
          
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text(
                            '\$${transaction[index].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle:
                        Text(DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: MediaQuery.of(context).size.width>400 ?
                      TextButton.icon(
                      onPressed: deletetx(transaction[index].id),
                      icon: const Icon( Icons.delete),
                      label: const Text('Delete',style: TextStyle(color: Colors.red)),
                      )
 

                      // if(!orienttation) check why not working
                      
                      
                      :IconButton(
                      icon: Icon(Icons.delete_sharp, color: Colors.red),
                      onPressed: () => deletetx(transaction[index].id),
                    ),
                  ),
                );
              }),
            );
  }
}
