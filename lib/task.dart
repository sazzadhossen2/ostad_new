class Task{
  String detail;
  DateTime Creatdatetime,updatedatetime;
  String status;
  Task({
    required this.detail,
    required this.Creatdatetime,
   required this.updatedatetime,
    this.status="Pending"
});
}