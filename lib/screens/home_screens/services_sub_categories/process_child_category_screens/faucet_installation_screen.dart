import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../screens/home_screens/services_sub_categories/process_child_screen_steps/faucet_installation_step.dart';
import '../../../../screens/home_screens/services_sub_categories/process_child_screen_steps/general_step_2.dart';
import '../../../../screens/home_screens/services_sub_categories/process_child_screen_steps/general_step_3.dart';
import '../process_child_screen_steps/general_step_2.5.dart';
import '../process_child_screen_steps/general_step_3.0.dart';

class FaucetInstallationScreen extends StatefulWidget {
  const FaucetInstallationScreen({Key? key}) : super(key: key);

  @override
  State<FaucetInstallationScreen> createState() =>
      _FaucetInstallationScreenState();
}

class _FaucetInstallationScreenState extends State<FaucetInstallationScreen> {
  int currentStep = 0;
  int? mId;
  int? subId;
  int? childId;
  String? title;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    mId = routeArgs['mainCategoryId'];
    subId = routeArgs['subCategoryId'];
    childId = routeArgs['childCategoryId'];
    title = routeArgs['childCategoryTitle'];
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        constProviderData.clearData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            title!,
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
              print('mainCategoryId: $mId');
              print("subCategoryId: $subId");
              print("childCategoryId: $childId");
              print("childCategoryTitle: $title");
              print("Flush Fixes Amount: ${constProviderData.fixesAmount}");
              print("selected date: ${constProviderData.selectedDate}");
              print("selected time: ${constProviderData.pickedTime}");
              print("selected duration: ${constProviderData.duration}");
              print("selected rate: ${constProviderData.hourlyRate}");
              print("isUrgent : ${constProviderData.checkUrgentJob}");
              print("provider required : ${constProviderData.providersAmount}");
              print("image1 : ${constProviderData.imageFile0}");
              print("image2 : ${constProviderData.imageFile1}");
              print("image3 : ${constProviderData.imageFile2}");
              print("address : ${constProviderData.completeAddress}");
              print("longitude : ${constProviderData.longitude}");
              print("latitude : ${constProviderData.latitude}");
              print("Postal Code : ${constProviderData.postalCode}");
              print("work Description : ${constProviderData.workDetails}");

              FocusScope.of(context).unfocus();
              constProviderData.postJob(
                context,
                mId.toString(),
                subId.toString(),
                childId.toString(),
                title!,
                constProviderData.selectedDate.toString(),
                constProviderData.statusName.toString(),
                constProviderData.duration.toString(),
                constProviderData.hourlyRate.toString(),
                constProviderData.checkUrgentJob.toString(),
                constProviderData.providersAmount.toString(),
                constProviderData.estimateBudge.toString(),
                constProviderData.completeAddress,
                constProviderData.longitude.toString(),
                constProviderData.latitude.toString(),
                constProviderData.postalCode,
                constProviderData.countryDropDownValue,
                constProviderData.workDetails,
                constProviderData.fixesAmount.toString(),
                constProviderData.mediumSizedFurnitureAmount.toString(),
                constProviderData.largeSizedFurnitureAmount.toString(),
                constProviderData.veryLargeSizedFurnitureAmount.toString(),
                constProviderData.cleanBoxTitle,
                "",
                constProviderData.needWork,
                "",
                "",
                "",
                constProviderData.pickupAddress,
                constProviderData.destinationAddress,
                constProviderData.surface.toString(),
                constProviderData.imageFile0,
                constProviderData.imageFile1,
                constProviderData.imageFile2,
              );
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
            return Consumer<ConstProvider>(
              builder: (_, fixes, child) => Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: <Widget>[
                    ((currentStep < 1) && (fixes.fixesAmount > 0))
                        ? Expanded(
                            child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50.0),
                              primary: Theme.of(context).primaryColor,
                              elevation: 5,
                            ),
                            child: Text(
                              currentStep > 1
                                  ? "Process_Screen_Confirm_Button"
                                  : "Process_Screen_Continue_Button",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Cerebri Sans Regular',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            ).tr(),
                          ))
                        : const SizedBox(),
                    ((currentStep == 1))
                        ? Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 5,
                        ),
                        child: Text(
                          currentStep > 1
                              ? "Process_Screen_Confirm_Button"
                              : "Process_Screen_Continue_Button",
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cerebri Sans Regular',
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              letterSpacing: 1),
                        ).tr(),
                      ),
                    )
                        : const SizedBox(),
                    ((currentStep == 2) &&
                        (fixes.duration > 0) &&
                        (fixes.hourlyRate > 0))
                        ? Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 5,
                        ),
                        child: Text(
                          currentStep > 2
                              ? "Process_Screen_Confirm_Button"
                              : "Process_Screen_Continue_Button",
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cerebri Sans Regular',
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              letterSpacing: 1),
                        ).tr(),
                      ),
                    )
                        : const SizedBox(),
                    ((currentStep == 3))
                        ? Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 5,
                        ),
                        child: Text(
                          currentStep > 3
                              ? "Process_Screen_Confirm_Button"
                              : "Process_Screen_Continue_Button",
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cerebri Sans Regular',
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              letterSpacing: 1),
                        ).tr(),
                      ),
                    )
                        : const SizedBox(),
                    ((currentStep == 4) &&
                        (fixes.completeAddress != '') &&
                        (fixes.postalCode != '') &&
                        (fixes.countryDropDownValue != 'null'))
                        ? Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50.0),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 5,
                        ),
                        child: Text(
                          currentStep == 4
                              ? "Process_Screen_Confirm_Button"
                              : "Process_Screen_Continue_Button",
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cerebri Sans Regular',
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              letterSpacing: 1),
                        ).tr(),
                      ),
                    )
                        : const SizedBox(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
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
                            letterSpacing: 1),
                      ).tr(),
                    )),
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
          content: const FaucetInstallationStep(),
        ),
    Step(
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      title: const Text(""),
      content: const GeneralStep2Screen(),
    ),
    Step(
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      title: const Text(""),
      content: GeneralStep02(
          mainCategoryId: mId!,
          subCategoryId: subId!,
          childCategoryId: childId),
    ),
    Step(
      isActive: currentStep >= 3,
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      title: const Text(""),
      content: const GeneralStep03(),
    ),
    Step(
      isActive: currentStep >= 4,
      title: const Text(""),
      content: const GeneralStep3Screen(),
    ),
      ];
}
