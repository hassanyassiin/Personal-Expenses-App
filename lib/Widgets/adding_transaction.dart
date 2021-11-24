import 'package:flutter/material.dart';

class AddingTransaction extends StatefulWidget {
  final Function addTransaction;

  AddingTransaction(this.addTransaction);

  @override
  State<AddingTransaction> createState() => _AddingTransactionState();
}

class _AddingTransactionState extends State<AddingTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.addTransaction(
        enteredTitle,
        enteredAmount,
      );

    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: ' Title',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'Amount',
                hintText: ' Amount',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              child: const Text('Add Transaction'),
              textColor: Colors.red,
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
