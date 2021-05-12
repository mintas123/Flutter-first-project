import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteFn;

  TransactionList(this.transactions, this.deleteFn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constrains) {
              return Column(
                children: [
                  Text(
                    "No transactions added yet.",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  child: Card(
                    color: Colors.white54,
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                            '${transactions[index].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].dateTime),
                      ),
                      trailing: MediaQuery.of(context).size.width > 460
                          ? TextButton.icon(
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.black45)),
                              onPressed: () => deleteFn(transactions[index].id),
                              icon: Icon(Icons.delete),
                              label: Text("Delete"))
                          : IconButton(
                              icon: Icon(
                                Icons.delete,
                              ),
                              onPressed: () => deleteFn(transactions[index].id),
                            ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
