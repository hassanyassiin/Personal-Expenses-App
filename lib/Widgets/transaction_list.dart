import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionmap;

  TransactionList(this._transactionmap);

  @override
  Widget build(BuildContext context) {
    return _transactionmap.isEmpty
        ? Column(
            children: <Widget>[
              const Text(
                'There\'s no Transactions yet',
                style: TextStyle(fontSize: 20, fontFamily: 'Estonia'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(height:200,child: Image.asset('Images/zzz.png',fit: BoxFit.cover,))
            ],
          )
        : SizedBox(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            '\$ ${_transactionmap[index].amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                            ), //
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              _transactionmap[index].title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily:
                                      'Estonia', //Todo why FamilyFont does not work here?
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(_transactionmap[index].date),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: _transactionmap.length,
            ));
  }
}
