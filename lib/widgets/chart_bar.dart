import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

final String label;
final double spendingAmount;
final double spendingPercentageAmount;

ChartBar(this.label , this.spendingAmount , this.spendingPercentageAmount);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
            FittedBox(child:Text('\$ ${spendingAmount.toStringAsFixed(0)} ')),
             const SizedBox(height:10),
                   Container(height: 60,width: 10,child: Stack(children: [
                     Container(decoration: BoxDecoration(border: Border.all(color:Colors.green,width: 1)
                     ,color:const Color.fromRGBO(220, 220, 220, 1), borderRadius: BorderRadius.circular(10)),
                     ) , FractionallySizedBox(heightFactor: 0.25,child: Container(decoration: BoxDecoration(color:Theme.of(context).primaryColorDark),),)]
                     ,),),const SizedBox(height: 10,),FittedBox(child:Text('${label} ')),
                     ]);
  }
}