import 'package:flutter/cupertino.dart';
import '../Widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> chartTransactions;

  Chart(this.chartTransactions);

  List<Map<String, dynamic>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (int i = 0; i < chartTransactions.length; i++) {
        if (chartTransactions[i].date.day == weekDay.day &&
            chartTransactions[i].date.month == weekDay.month &&
            chartTransactions[i].date.year == weekDay.year) {
          totalSum += chartTransactions[i].amount;
        }
      }

      // return {'day': DateFormat.E().format(weekDay).substring(0,1), 'amount': totalSum};
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransaction.map((data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
                fit: FlexFit.tight,
                child: chartBar(
                    amount: data['amount'],
                    label: data['day'],
                    percentage: maxSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / maxSpending)),
          );
        }).toList(),
      ),
    );
  }
}
