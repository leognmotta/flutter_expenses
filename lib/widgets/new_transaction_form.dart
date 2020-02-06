import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  final Function addNewTransaction;

  NewTransactionForm(this.addNewTransaction);

  @override
  _NewTransactionFormState createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    titleController.clear();
    amountController.clear();

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Add Transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
