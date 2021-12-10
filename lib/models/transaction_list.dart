import 'package:expenses_app/widgets/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactional_list;
  Function deleteTransaction;

  TransactionList(this.transactional_list,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactional_list.isEmpty?
     const Text("No Trasnaction List Is Present!")
    //  SizedBox(height:10),
   // Container(height: 200, child:Image.asset('lib/assets/images/waiting.png',fit:BoxFit.cover,)):
    :Container(height:300 ,child:      
     ListView.builder(itemBuilder: (context,index){
       return Card(margin: EdgeInsets.all(10),elevation: 10, child: ListTile(
         leading: CircleAvatar
         (radius: 30,child:
         FittedBox(child: Text('\$${transactional_list[index].amount}')),
         ),title: Text('${transactional_list[index].title}')
         ,subtitle: Text('${DateFormat().add_yMMMd().format(transactional_list[index].dateTime)}'),
         trailing: IconButton(onPressed: ()=> deleteTransaction(transactional_list[index].id), icon:const Icon(Icons.delete),color: Colors.red,),),);
     },itemCount: transactional_list.length,),);
  }
}