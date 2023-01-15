import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class new_transaction extends StatefulWidget {
  final Function addtx;

  new_transaction({super.key, required this.addtx});

  @override
  State<new_transaction> createState() => _new_transactionState();
}

class _new_transactionState extends State<new_transaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitdata() {
    final entdtitle = titlecontroller.text;
    final entdamt = double.parse(amountcontroller.text);

    if (entdtitle.isEmpty || entdamt <= 0) {
      return;
    }

    widget.addtx(
      titlecontroller.text,
      double.parse(amountcontroller.text),
    );

    Navigator.of(context).pop();
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10, backgroundColor: Theme.of(context).primaryColorDark),
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
