import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Nova Transacao'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}