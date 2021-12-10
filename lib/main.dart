import 'package:expenses_app/models/transaction_list.dart';
import 'package:expenses_app/widgets/chart.dart';
import 'package:expenses_app/widgets/input_widget.dart';
import 'package:expenses_app/widgets/transaction.dart';
import 'package:expenses_app/widgets/use_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    return MySecondApp();
  }

}
class MySecondApp extends State<MyApp>{

    final List<Transaction> transactionList= [] ;

@override
Widget build(BuildContext context){

final appBar = AppBar(title: const Text("Budget Calculator App",));

  return MaterialApp(theme:ThemeData(primarySwatch:Colors.purple , accentColor: Colors.amber), home: Scaffold(
    appBar: appBar
    ,body:
    LayoutBuilder(builder: (context , constraint){
      return Column(children: [
      Container(height: constraint.maxHeight, width: constraint.maxWidth,
       child:TransactionFunctionality(transactionList),)
      ],);
    })));  
}
}

