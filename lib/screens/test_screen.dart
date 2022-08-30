import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/const_provider/const_provider.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double values = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Test Screen",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
            ],
          ),
        ),
      ),
    );
  }
}
