import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deletTx;

  TransactionList(this.transactionList, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transaction added yet.',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ))
            ],
          )
        : ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                            '\$${transactionList[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactionList[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('dd-MM-yyyy')
                        .format(transactionList[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deletTx(transactionList[index].id);
                      }),
                ),
              );
            },
            itemCount: transactionList.length,
          );
  }
}
