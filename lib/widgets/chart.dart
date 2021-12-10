import 'package:expenses_app/widgets/chart_bar.dart';
import 'package:expenses_app/widgets/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

final List<Transaction> recentTransaction;

double spendingVizualization(double amount){
  return 1/amount;
}

Chart(this.recentTransaction);
List<Map<String , Object>>get groupTransactionValues{
  return List.generate(7, (index){
    double totalSum=0;
    final weekday = DateTime.now().subtract(Duration(days: index));
   // print(weekday.day);
    for(var i=0;i<recentTransaction.length;i++){
      if(recentTransaction[i].dateTime.day == weekday.day 
      && recentTransaction[i].dateTime.month == weekday.month && recentTransaction[i].dateTime.year == weekday.year){
        totalSum+=recentTransaction[i].amount;
      }
    }
   // print(totalSum);
    return {'day':DateFormat.E().format(weekday).substring(0,1) , 'amount':totalSum};
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(height: 160, child: Card(
      elevation:6 ,margin: const EdgeInsets.all(20),
      child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround ,children:
        groupTransactionValues.map<Widget>((data){
          return Flexible(fit:FlexFit.tight, child:  ChartBar(data['day'].toString(), double.parse(data['amount'].toString()), spendingVizualization(double.parse(data['amount'].toString()))));
        }).toList()
      ),));
  }
}