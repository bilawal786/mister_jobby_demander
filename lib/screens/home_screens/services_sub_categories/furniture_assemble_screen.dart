import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import './process_steps_screens/furniture_assemble_step.dart';

import '../../../providers/const_provider/const_provider.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/general_step_2_screen.dart';
import '../../../screens/home_screens/services_sub_categories/process_steps_screens/general_step_3_screen.dart';

class FurnitureAssembleScreen extends StatefulWidget {
  const FurnitureAssembleScreen({Key? key}) : super(key: key);

  @override
  State<FurnitureAssembleScreen> createState() => _FurnitureAssembleScreenState();
}

class _FurnitureAssembleScreenState extends State<FurnitureAssembleScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final constProviderData = Provider.of<ConstProvider>(context,listen: false);
    return WillPopScope(
      onWillPop:  ()async{
        constProviderData.clearData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black38,
          ),
          title: Text(
            "furniture_Assembly_Title",
            style: Theme.of(context).textTheme.bodyLarge,
          ).tr(),
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
                builder: (_,furnitureAssemble,child) => Row(
                  children: <Widget>[
                    if((furnitureAssemble.smallSizedFurnitureAmount > 0 || furnitureAssemble.mediumSizedFurnitureAmount > 0 || furnitureAssemble.largeSizedFurnitureAmount > 0 || furnitureAssemble.veryLargeSizedFurnitureAmount > 0) && (furnitureAssemble.cleanBoxFurnitureNo == true || furnitureAssemble.cleanBoxFurnitureYes == true))
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
          content: const GeneralStep2Screen(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(""),
          content:const GeneralStep3Screen(),
        ),
      ];
}
