import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {

    double mostExpense = 0.0;

    expenses.forEach((expense) {
      if (expense > mostExpense) {
        mostExpense = expense;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            'Weekly Spending',
            style: TextStyle(
              letterSpacing: 1.2,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                onPressed: () {},
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  'May 12, 2019 - May 19, 2019',
                  maxLines: 20,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Bar(
                  label: 'Su',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[0],
                ),
                 Bar(
                  label: 'Mo',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[1],
                ),
                 Bar(
                  label: 'Tu',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[2],
                ),
                Bar(
                  label: 'We',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[3],
                ),
                 Bar(
                  label: 'Th',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[4],
                ),
                 Bar(
                  label: 'Fr',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[5],
                ),
                 Bar(
                  label: 'Sa',
                  mostExpensive: mostExpense,
                  amountSpent: expenses[6],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;
  Bar({this.label, this.amountSpent, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Container(
      width: ((MediaQuery.of(context).size.width) / 7) * 0.8,
      child: Column(
        children: <Widget>[
          Text(
            '\$${amountSpent.toStringAsFixed(1)}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.0),
          Container(
              height: barHeight,
              width: ((MediaQuery.of(context).size.width * 0.8) / 7) * 0.5 ,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
