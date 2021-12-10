import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  final titleController=TextEditingController();
  final amountController=TextEditingController();
  DateTime pickedDate=DateTime.now();

  final Function addTxn;

  Input(this.addTxn);
  
  void addTransaction(BuildContext context){
   String title=titleController.text;
   double amount=double.parse(amountController.text);
   if(title!=null && !title.isEmpty){ 
    addTxn(titleController.text,double.parse(amountController.text),pickedDate);
    Navigator.of(context).pop();
   }else{
     return;
   }
  }
  
  @override
  Widget build(BuildContext context) {

    void pickTheDate(){

      showDatePicker(context: context,
       initialDate: DateTime.now(), firstDate: DateTime(2021), 
       lastDate: DateTime.now()).then((pickDate){
         if(pickDate == null){
           return;
         }else{
           pickDate=pickedDate;
         }
       });

    }
    return    
        SingleChildScrollView(child: Container(padding:
         EdgeInsets.only(
           top: 10,left: 10 , right: 10 , bottom: MediaQuery.of(context).viewInsets.bottom + 10),
         child: Card(child:Column(children: [
         TextField(decoration: const InputDecoration(labelText: 'Enter Title'),controller: titleController,),
         TextField(decoration: const InputDecoration(labelText: 'Enter Amount'),controller: amountController,keyboardType: TextInputType.number,onSubmitted:(_)=>addTransaction,),
         const SizedBox(height: 10,),
          FlatButton(onPressed:pickTheDate, child: Text('Choose Date'),color:Theme.of(context).primaryColorDark),
         TextButton(onPressed: ()=>addTransaction(context), child: Text("Submit",style:TextStyle(color: Colors.purple)))
       ],)))); 
  }
}