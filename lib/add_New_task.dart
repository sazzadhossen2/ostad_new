
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_new/task.dart';

class Addnewtaskmodel extends StatefulWidget {
  const Addnewtaskmodel({
    super.key, required this.onadd,
  });
final Function(Task) onadd;

  @override
  State<Addnewtaskmodel> createState() => _AddnewtaskmodelState();
}

class _AddnewtaskmodelState extends State<Addnewtaskmodel> {
  final TextEditingController TodoTeController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add New Todo",style:Theme.of(context).textTheme.titleLarge,),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.clear)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: TodoTeController,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "Enter New Todo",

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                ),
                validator: (String?value){
                  if(value?.isEmpty??true){
                    return "Enter anything";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width:double.infinity,
                  child: ElevatedButton(
                      onPressed: (){

                    if(_formkey.currentState!.validate()){
                      Task task=Task(detail: TodoTeController.text.trim(),
                          Creatdatetime:DateTime.now(),
                          updatedatetime: DateTime.now());
                      widget.onadd(task);
                      Navigator.pop(context);
                    }
                  }, child: Text("Add"))),
            )
          ],
        ),
      ),
    );
  }
}