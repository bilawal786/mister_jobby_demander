import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';


class ProcessScreen extends StatefulWidget {
  const ProcessScreen({Key? key}) : super(key: key);

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        title: Text(
          "Process Screen",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Stepper(
        elevation: 0,
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            print("Step completed");
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepCancel: () {
          currentStep == 0
              ? Navigator.of(context).pop()
              : setState(() => currentStep -= 1);
        },
        controlsBuilder: (context, ControlsDetails details) {
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50.0),
                      primary: Theme.of(context).primaryColor,
                      elevation: 0,
                    ),
                    child: Text(
                      currentStep > 1 ? "Process_Screen_Confirm_Button" : "Process_Screen_Continue_Button",
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cerebri Sans Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          letterSpacing: 1
                      ),
                    ).tr(),
                  )
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 40,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepCancel,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50.0),
                      primary: Colors.black12,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Process_Screen_Cancel_Button",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cerebri Sans Regular',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          letterSpacing: 1
                      ),
                    ).tr(),
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          title: const Text(""),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Furniture assembly", style: Theme.of(context).textTheme.bodyMedium,),
                SizedBox(height: MediaQuery.of(context).size.width / 40,),
                Text("What do you need?", style: Theme.of(context).textTheme.titleMedium,),
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
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Text(""),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(""),
          content: Container(),
        ),
      ];
}
