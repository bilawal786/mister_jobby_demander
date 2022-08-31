import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';




import 'package:provider/provider.dart';

import '../../../providers/const_provider/const_provider.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/general_step_3_screen.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/parquet_installation_step.dart';



class ParquetInstallationScreen extends StatefulWidget {
  const ParquetInstallationScreen({Key? key}) : super(key: key);

  @override
  State<ParquetInstallationScreen> createState() => _ParquetInstallationScreenState();
}

class _ParquetInstallationScreenState extends State<ParquetInstallationScreen> {
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
          "Parquet Installation",
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
              builder: (_,mirror,child) => Row(
                children: <Widget>[
                  if(mirror.mirrorAmount > 0)
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
      content: const ParquetInstallationStep(),
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
      content:const GeneralStep3Screen(),
    ),
  ];
}