import 'package:flutter/material.dart';

class PopularServicesListView extends StatelessWidget {
  const PopularServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => Padding(
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
                    "https://s3-us-west-2.amazonaws.com/prd-rteditorial/wp-content/uploads/2020/07/31142105/700StopMotion.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bricolage",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
