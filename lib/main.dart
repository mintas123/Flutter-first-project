import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Personal Finance App",
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.deepOrange,
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          fontFamily: 'QuickSand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.dark().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                  )),
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction('t1', "Shoes", 249.99, DateTime.now()),
    Transaction(
        't2', "Snacks", 6.49, DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        't3', "Groceries", 36.99, DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        't4', "T-shirt", 59.99, DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        't5', "Uber eats", 35.99, DateTime.now().subtract(Duration(days: 5))),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) => element.dateTime
            .isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  List<Transaction> get _sortedTransactions {
    var _sortedList = _userTransactions;
    _sortedList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return _sortedList.reversed.toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTrans =
        Transaction(DateTime.now().toString(), title, amount, date);

    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final _isLandscape = mediaQuery.orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Color(0xff282726),
      appBar: AppBar(
        title: Text('Personal Finance App'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => _startAddNewTransaction(context)),
        ],
      ),
      body: Column(
        children: <Widget>[
          if (_isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                ),
              ],
            ),
          if (!_isLandscape)
            Container(
              height: mediaQuery.size.height * 0.3,
              child: Chart(_recentTransactions),
            ),
          if (!_isLandscape)
            Expanded(
              child: TransactionList(
                _sortedTransactions,
                _deleteTransaction,
              ),
            ),
          if (_isLandscape)
            _showChart
                ? Container(
                    height: mediaQuery.size.height * 0.5,
                    child: Chart(_recentTransactions),
                  )
                : Expanded(
                    child: TransactionList(
                      _sortedTransactions,
                      _deleteTransaction,
                    ),
                  ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
