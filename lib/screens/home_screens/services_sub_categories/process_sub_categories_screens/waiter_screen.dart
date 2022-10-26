import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../process_child_screen_steps/general_step_2.dart';
import '../process_child_screen_steps/general_step_3.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../screens/home_screens/services_sub_categories/process_sub_categories_steps/waiter_step.dart';

class WaiterScreen extends StatefulWidget {
  const WaiterScreen({Key? key}) : super(key: key);

  @override
  State<WaiterScreen> createState() => _WaiterScreenState();
}

class _WaiterScreenState extends State<WaiterScreen> {
  int currentStep = 0;
  int? mainCateId;
  int? subCateId;
  String? subCateTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    mainCateId = routeArgs['mainCategoryId'];
    subCateId = routeArgs['subCategoryId'];
    subCateTitle = routeArgs['subCategoryTitle'];
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
            color: Colors.black38,
          ),
          title: Text(
           subCateTitle!,
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
              print('mainCategoryId: $mainCateId');
              print("subCategoryId: $subCateId");
              print("subCategoryTitle: $subCateTitle");

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
                mainCateId.toString(),
                subCateId.toString(),
                0.toString(),
                subCateTitle!,
                constProviderData.selectedDate.toString(),
                "${constProviderData.pickedTime.hour < 10 ? "0${constProviderData.pickedTime.hour}":"${constProviderData.pickedTime.hour}"}:${constProviderData.pickedTime.minute < 10 ? "0${constProviderData.pickedTime.minute}" : "${constProviderData.pickedTime.minute}"}",
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
                constProviderData.smallSizedFurnitureAmount.toString(),
                constProviderData.mediumSizedFurnitureAmount.toString(),
                constProviderData.largeSizedFurnitureAmount.toString(),
                constProviderData.veryLargeSizedFurnitureAmount.toString(),
                constProviderData.groupValue.toString(),
                constProviderData.fixesAmount.toString(),
                constProviderData.needWork,
                constProviderData.jobberRemoveWasteTitle,
                constProviderData.frequencyTitle,
                "",
                constProviderData.pickupAddress,
                constProviderData.destinationAddress,
                constProviderData.areaToMowSliderValue.toString(),
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
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Consumer<ConstProvider>(
                builder: (_, size, child) => Row(
                  children: <Widget>[
                    if ((size.fixesAmount > 0) &&
                        (size.jobberRemoveWasteTitle == "Yes" ||
                            size.jobberRemoveWasteTitle == "No"))
                      Expanded(
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
                        ),
                      ),
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
                      ),
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
          content: const WaiterStep(),
        ),
        Step(
          isActive: currentStep >= 1,
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          title: const Text(""),
          content: GeneralStep2Screen(mainCategoryId: mainCateId!, subCategoryId: subCateId!,childCategoryId: 0),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(""),
          content: const GeneralStep3Screen(),
        ),
      ];
}
