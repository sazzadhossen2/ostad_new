
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_new/add_New_task.dart';
import 'package:ostad_new/task.dart';
import 'package:ostad_new/update_screen.dart';
import 'package:intl/intl.dart';
class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
List<Task>Tasklist=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Apps"),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context){
          return Addnewtaskmodel(onadd: (Task task){
            addTask(task);
          },);
        });
      },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(

          itemBuilder: (context ,index){
            final String formdatetime=DateFormat('hh:mm a dd-MM-yyyy').format(Tasklist[index].Creatdatetime) ;
        return ListTile(
          textColor: Tasklist[index].status=='Done'?Colors.grey:null,
          onTap: (){
            showDialog(context: context, builder:(context){
              return AlertDialog(
                title: Text("Action"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title:Text("Edit"),
                      leading: Icon(Icons.edit),
                      onTap: (){
                        Navigator.pop(context);
                        showModalBottomSheet(context: context, builder: (context){
                          return Updatetaskmodal(todo: Tasklist[index], onTodoUpdate: (String UpdateddetailTaxt) { 
                            updatetodo(index, UpdateddetailTaxt);
                          },);
                        });
                      },
                    ),
                    Divider(height: 10,),
                    ListTile(
                      leading: Icon(Icons.delete),
                      title: Text("Delet"),
                      onTap: (){
                        deletTOdo(index);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              );
            });
          },
          onLongPress: (){

            String currentstatus= Tasklist[index].status=='Pending'?'Done':"Pending";
            updatetodostatus(index, currentstatus);
          },

          title: Text(Tasklist[index].detail),

          trailing: Text(Tasklist[index].status.toUpperCase()),
          leading: CircleAvatar(
            child: Text('${index+1}'),

          ),
          subtitle: Text(formdatetime),
        );
      }, separatorBuilder:(context,index){
        return Divider(
          height: 4,
        );
      }, itemCount: Tasklist.length),
    );
  }
  void addTask(Task task){
    setState(() {
      Tasklist.add(task);
    });
  }
  void deletTOdo(int index){
    setState(() {
      Tasklist.removeAt(index);
    });
  }

  void updatetodo(int index,String taskdetail){
    Tasklist[index].detail=taskdetail;
    setState(() {

    });
  }

void updatetodostatus(int index,String status){
  Tasklist[index].status=status;
  setState(() {

  });
}
}

