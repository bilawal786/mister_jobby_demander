import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/const_widgets/custom_button.dart';

class ChildCareStep extends StatefulWidget {
  const ChildCareStep({Key? key}) : super(key: key);

  @override
  State<ChildCareStep> createState() => _ChildCareStepState();
}

class _ChildCareStepState extends State<ChildCareStep> {
  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if(constProviderData.gender != [])
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: constProviderData.gender.length,
            itemBuilder: (ctx, index) => Consumer<ConstProvider>(
              builder: (_, constData, child) => Card(
                elevation: 5,
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Child Care",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                constProviderData.childCareDecrement(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Gender",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  constData.gender[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 40,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Add_Child_Step_DOB",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  constData.doB[index],
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          CustomButton(
            onPress: () {
              constProviderData.childCareIncrement(context);
            },
            buttonName: "Add_Child",
          ),
        ],
      ),
    );
  }
}
