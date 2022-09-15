
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  int childValue = 0;
  String _dropDownValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Test Screen",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
             shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (ctx,index)=>ListTile(
            title:  Text("7 days ago",style: Theme.of(context).textTheme.labelMedium,),
            subtitle: Text("your job 'Assembly of IKEA furniture' has been closed",style: Theme.of(context).textTheme.labelLarge,),
            trailing:const Icon(Icons.arrow_forward_ios_outlined,size: 20,),

          ),),
        ),
      ),
    );
  }
}
