import 'package:expenses_app/models/transaction_list.dart';
import 'package:expenses_app/widgets/chart.dart';
import 'package:expenses_app/widgets/input_widget.dart';
import 'package:expenses_app/widgets/transaction.dart';

import 'package:flutter/material.dart';

class TransactionFunctionality extends StatefulWidget {

final List<Transaction> transactionList;

TransactionFunctionality(this.transactionList);

@override
  State<StatefulWidget> createState() {
    return State1(transactionList);
  }
}
  class State1 extends State<TransactionFunctionality> {
    
  final List<Transaction> transactionList;

  State1(this.transactionList);


  List<Transaction> get recentTransaction{
    return transactionList.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addIntoMyList(String title , double amount,DateTime pickedDate){
    final newTxn=Transaction(amount,pickedDate,(transactionList.length+1).toString(),title);
    setState(() {
      transactionList.add(newTxn);
    });
  }

  void deleteTransaction(String id){
    setState(() {
      transactionList.removeWhere((element) => element.id == id);
    });
  }
      void showUpBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
     return Input(addIntoMyList); 
    });
  }
    bool showChart=true;

    @override
    Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context,constraint) {
        return Column(children: [
          Row(mainAxisAlignment :MainAxisAlignment.center
          ,children: [
           const Text('Show Chart'),
            Switch(value: showChart, onChanged: (val) {
                setState(() {
                  showChart=val;
                });
          })
          ],),
          (showChart == true)?Container(height: constraint.maxHeight * 0.4 , child:Chart(recentTransaction)):SizedBox(height:10)
          ,TextButton.icon
          (onPressed: ()=>showUpBottomSheet(context),icon: Icon(Icons.add), label: Text("Tap Me") )
          ,Container(height: (showChart == false) ? constraint.maxHeight * 0.8:constraint.maxHeight * 0.4, child: TransactionList(transactionList,deleteTransaction))]
        ); 
      }); 
    }
  }
