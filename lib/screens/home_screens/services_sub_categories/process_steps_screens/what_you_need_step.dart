import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class WhatYouNeed extends StatelessWidget {
  const WhatYouNeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Furniture_Assembly_Step_Title", style: Theme.of(context).textTheme.bodyMedium,).tr(),
          SizedBox(height: MediaQuery.of(context).size.width / 40,),
          Text("What_You_Need_Step_SubTitle", style: Theme.of(context).textTheme.titleMedium,).tr(),
          SizedBox(height: MediaQuery.of(context).size.width / 40,),
          Text("Select the number of pieces of furniture to assemble", style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(height: MediaQuery.of(context).size.width / 40,),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Furniture assembly", style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("Select the number of pieces of furniture to assemble", style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(onTap: (){}, icon: Icons.remove,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("1", style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    RoundedButton(onTap: (){}, icon: Icons.add,),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Furniture assembly", style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("Select the number of pieces of furniture to assemble", style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(onTap: (){}, icon: Icons.remove,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("1", style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    RoundedButton(onTap: (){}, icon: Icons.add,),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Furniture assembly", style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("Select the number of pieces of furniture to assemble", style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(onTap: (){}, icon: Icons.remove,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("1", style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    RoundedButton(onTap: (){}, icon: Icons.add,),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Furniture assembly", style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("Select the number of pieces of furniture to assemble", style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(onTap: (){}, icon: Icons.remove,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    Text("1", style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(height: MediaQuery.of(context).size.width / 40,),
                    RoundedButton(onTap: (){}, icon: Icons.add,),
                  ],
                ),
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
