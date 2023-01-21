import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';

class new_transaction extends StatefulWidget {
  final Function addtx;

  new_transaction({super.key, required this.addtx});

  @override
  State<new_transaction> createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
  final titlecontroller = TextEditingController();
  late DateTime datepicked= DateTime.now();
  final amountcontroller = TextEditingController();

  void submitdata() {
    final entdtitle = titlecontroller.text;
    final entdamt = double.parse(amountcontroller.text);

    if (entdtitle.isEmpty || entdamt <= 0|| datepicked == null) {
      return;
    }

    widget.addtx(
      titlecontroller.text,
      double.parse(amountcontroller.text),
    );

    Navigator.of(context).pop();

    }
    
    void presentdatepicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010),
              lastDate: DateTime.now())
          .then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          datepicked = value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'title'),
              controller: titlecontroller,
              // onChanged: (value) {
              //   title = value;

              // },
              onTap: () => submitdata,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              //onChanged: (value) => amount = value,
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onTap: () => submitdata,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( DateFormat.yMMMd().format(datepicked),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  ElevatedButton(
                      onPressed: presentdatepicker,
                      
                      child: Icon(Icons.calendar_month_outlined))
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Theme.of(context).primaryColorDark),
                onPressed: submitdata,
                child: Text(
                  'Add Tx',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
