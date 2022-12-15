import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/categories_provider/search_categories_provider.dart';
import '../process_child_screen_steps/furniture_assemble_step.dart';
import '../process_child_screen_steps/general_step_2.5.dart';
import '../process_child_screen_steps/general_step_2.dart';
import '../process_child_screen_steps/general_step_3.0.dart';
import '../process_child_screen_steps/general_step_3.dart';

import '../../../../providers/const_provider/const_provider.dart';

class FurnitureAssembleScreen extends StatefulWidget {
  const FurnitureAssembleScreen({Key? key}) : super(key: key);

  @override
  State<FurnitureAssembleScreen> createState() =>
      _FurnitureAssembleScreenState();
}

class _FurnitureAssembleScreenState extends State<FurnitureAssembleScreen> {
  int currentStep = 0;
  int mId = 0;
  int subId = 0;
  int childId = 0;
  int? price = 0;
  String? title;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    mId = routeArgs['mainCategoryId'];
    subId = routeArgs['subCategoryId'];
    childId = routeArgs['childCategoryId'];
    title = routeArgs['childCategoryTitle'];
    price = routeArgs['price'];

    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        constProviderData.clearData(context);
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
            "$title",
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
              // print('mainCategoryId: $mId');
              // print("subCategoryId: $subId");
              // print("childCategoryId: $childId");
              // print("childCategoryTitle: $title");
              // print("small: ${constProviderData.smallSizedFurnitureAmount}");
              // print("medium: ${constProviderData.mediumSizedFurnitureAmount}");
              // print("large: ${constProviderData.largeSizedFurnitureAmount}");
              // print(
              //     "extra Large: ${constProviderData.veryLargeSizedFurnitureAmount}");
              // print("question 1: ${constProviderData.cleanBoxTitle}");
              // print("selected date: ${constProviderData.selectedDate}");
              print(
                  "selected time: ${constProviderData.pickedTime.hour < 10 ? "0${constProviderData.pickedTime.hour}" : "${constProviderData.pickedTime.hour}"}:${constProviderData.pickedTime.minute < 10 ? "0${constProviderData.pickedTime.minute}" : "${constProviderData.pickedTime.minute}"}");
              print("selected duration: ${constProviderData.duration}");
              // print("selected rate: ${constProviderData.hourlyRate}");
              print("isUrgent : ${constProviderData.checkUrgentJob}");
              print("provider required : ${constProviderData.providersAmount}");
              print("image1 : ${constProviderData.imageFile0}");
              print("image2 : ${constProviderData.imageFile1}");
              print("image3 : ${constProviderData.imageFile2}");
              // print("address : ${constProviderData.completeAddress}");
              // print("longitude : ${constProviderData.longitude}");
              // print("latitude : ${constProviderData.latitude}");
              // print("Postal Code : ${constProviderData.postalCode}");
              // print("country Id : ${constProviderData.countryDropDownValue}");
              // print("work Description : ${constProviderData.workDetails}");

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
                constProviderData.smallSizedFurnitureAmount.toString(),
                constProviderData.mediumSizedFurnitureAmount.toString(),
                constProviderData.largeSizedFurnitureAmount.toString(),
                constProviderData.veryLargeSizedFurnitureAmount.toString(),
                constProviderData.cleanBoxTitle,
                constProviderData.fixesAmount.toString(),
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
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Consumer<ConstProvider>(
                builder: (_, furnitureAssemble, child) => Row(
                  children: <Widget>[
                    ((currentStep < 1) &&
                            (furnitureAssemble.smallSizedFurnitureAmount > 0 ||
                                furnitureAssemble.mediumSizedFurnitureAmount >
                                    0 ||
                                furnitureAssemble.largeSizedFurnitureAmount >
                                    0 ||
                                furnitureAssemble
                                        .veryLargeSizedFurnitureAmount >
                                    0) &&
                            (furnitureAssemble.cleanBoxTitle == "Yes".tr() ||
                                furnitureAssemble.cleanBoxTitle == "No".tr()))
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
                            (furnitureAssemble.duration > 0) &&
                            (furnitureAssemble.hourlyRate > 0))
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
                            (furnitureAssemble.completeAddress != '') &&
                            (furnitureAssemble.postalCode != '') &&
                            (furnitureAssemble.countryDropDownValue != 'null'))
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
                          backgroundColor: Colors.black12,
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
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          title: const Text(""),
          content: GeneralStep02(
              mainCategoryId: mId,
              subCategoryId: subId,
              childCategoryId: childId,
            price: price,
          ),
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
