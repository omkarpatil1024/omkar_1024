import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}


class _CourseDetailsState extends State<CourseDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   var data = ModalRoute.of(context)!.settings.arguments as Map;
   print(data.values);
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
