import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import './process_steps_screens/furniture_assemble_step.dart';

import '../../../providers/const_provider/const_provider.dart';


class FurnitureAssembleScreen extends StatefulWidget {
  const FurnitureAssembleScreen({Key? key}) : super(key: key);

  @override
  State<FurnitureAssembleScreen> createState() => _FurnitureAssembleScreenState();
}

class _FurnitureAssembleScreenState extends State<FurnitureAssembleScreen> {
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
          "Disassemble Furniture",
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
              builder: (_,size,child) => Row(
                children: <Widget>[
                  if(size.smallSizedFurnitureAmount > 0 || size.mediumSizedFurnitureAmount > 0 || size.largeSizedFurnitureAmount > 0 || size.veryLargeSizedFurnitureAmount > 0 )
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
          content: const FurnitureAssembleStep(),
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
