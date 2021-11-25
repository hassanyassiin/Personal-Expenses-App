import 'package:flutter/material.dart';
import '../Widgets/transaction_list.dart';
import './Widgets/adding_transaction.dart';
import './Models/transaction.dart';
import './Widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primarySwatch: Colors.red,
          //accentColor: Colors.amber,
          //fontFamily: 'Estonia',
          //textTheme: ThemeData.light().textTheme.copyWith(subtitle2: const TextStyle(fontFamily: 'Estonia',fontSize: 20)),
          // appBarTheme: AppBarTheme(
          //   textTheme: ThemeData.light().textTheme.copyWith(subtitle2: const Text Style(fontFamily: 'Quick ',fontSize: 20) ),
          // ),
          ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactionmap = [
    // Transaction(id: 't1', title: 'Shoes', amount: 72.0, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Jeans', amount: 44.0, date: DateTime.now()),
  ];

  void _addNewTransaction(String titleUser, double amountUser) {
    setState(() {
      _transactionmap.add(Transaction(
          id: 'id 3',
          title: titleUser,
          amount: amountUser,
          date: DateTime.now()));
    });
  }

  void _cheetTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return AddingTransaction(_addNewTransaction);
        });
  }

  List<Transaction> get _recentTransaction {
    return _transactionmap.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Open New Transaction',
            onPressed: () {
              _cheetTransaction(context);
            },
          ),
        ],
        title: const Text('Expenses App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_transactionmap),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cheetTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
