
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({Key key, @required this.job, this.onTap}) : super(key: key);
  final Job job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.0,
      ),),
      trailing: Icon(Icons.account_circle,
      color: Colors.white,),
      onTap: onTap,
    );
  }
}
