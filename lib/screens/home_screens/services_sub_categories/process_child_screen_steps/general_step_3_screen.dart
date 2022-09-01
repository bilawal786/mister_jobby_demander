import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/places_selected_input_widget.dart';

class GeneralStep3Screen extends StatelessWidget {
  const GeneralStep3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Information_about_Need_Step2_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Service_Do_You_Want_To_Add_Photos",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Consumer<ConstProvider>(
                  builder: (index, imageFileData, child) => SizedBox(
                    child: imageFileData.imageFile0 != null
                        ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile0 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(0);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 0);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Consumer<ConstProvider>(
                  builder: (index, imageFileData, child) => SizedBox(
                    child: imageFileData.imageFile1 != null
                        ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile1 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(1);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 1);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Consumer<ConstProvider>(
                  builder: (index, imageFileData, child) => SizedBox(
                    child: imageFileData.imageFile2 != null
                        ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile2 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(2);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 2);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Address_Title",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const GooglePlacesApi(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Postel Code",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Postel_Code".tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Country_Title",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Country_Title".tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Do_You_Have_Details_Title",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          TextFormField(
            initialValue: 'Furniture_Repair_Step_Title'.tr(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titre de la demande',
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Furniture_Repair_Step_DescriptionTitle'.tr(),
              hintText: 'Furniture_Repair_Step_DescriptionTitle'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
        ],
      ),
    );
  }
}
