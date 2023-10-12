
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_new/task.dart';

class Updatetaskmodal extends StatefulWidget {

   Updatetaskmodal({
    super.key,
    required this.todo,
    required this.onTodoUpdate
  });

  final Task todo;
  final Function(String) onTodoUpdate;

  @override
  State<Updatetaskmodal> createState() => _UpdatetaskmodalState();
}


class _UpdatetaskmodalState extends State<Updatetaskmodal> {
late final TextEditingController TEcontroller=TextEditingController(text: widget.todo.detail);
final GlobalKey<FormState> _form =GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _form,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Update Todo",style:Theme.of(context).textTheme.titleLarge,),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.clear)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: TEcontroller,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "Enter New Todo",

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                ),validator: (String?value){
                  if(value?.isEmpty??true){
                    return "Enter valu";
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
                  child: ElevatedButton(onPressed: (){
                    if(_form.currentState!.validate()){
                    widget.onTodoUpdate(TEcontroller.text.trim());
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