import 'package:flutter/material.dart';
import 'package:mister_jobby/models/categories_models/main_categories_model.dart';

import '../../helpers/routes.dart';

class PopularServicesListItems extends StatelessWidget {
  final ChildCategory? childCategory;
  const PopularServicesListItems({Key? key, required this.childCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.2,
            height: MediaQuery.of(context).size.width / 4.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "${MyRoutes.IMAGEURL}/${childCategory!.img}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
            child: Text(
              childCategory!.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
            child: Row(
              children: [
                Text(
                  "Price:",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "${childCategory!.price} €",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
