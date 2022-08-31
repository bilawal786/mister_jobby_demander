import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:provider/provider.dart';

import '../../../providers/const_provider/const_provider.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/hang_tv_step.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/general_step_2_screen.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/general_step_3_screen.dart';




class HangTVScreen extends StatefulWidget {
  const HangTVScreen({Key? key}) : super(key: key);

  @override
  State<HangTVScreen> createState() => _HangTVScreenState();
}

class _HangTVScreenState extends State<HangTVScreen> {
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
          "Hang a TV",
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
            child: Consumer<ConstProvider>(
              builder: (_,tv,child) => Row(
                children: <Widget>[
                  if(tv.tvHangNo1 == 1 || tv.tvHangNo2 == 2 || tv.tvHangNo3 == 3 || tv.tvHangNo4 == 4 || tv.tvHangNo5 == 5)
                    Expanded(
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50.0),
                            primary: Theme.of(context).primaryColor,
                            elevation: 5,
                          ),
                          child: Text(
                            currentStep > 1 ? "Process_Screen_Confirm_Button" : "Process_Screen_Continue_Button",
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Cerebri Sans Regular',
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
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
      content: const HangTVStep(),
    ),
    Step(
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      title: const Text(""),
      content: const GeneralStep2Screen(),
    ),
    Step(
      isActive: currentStep >= 2,
      title: const Text(""),
      content:const GeneralStep3Screen(),
    ),
  ];
}
