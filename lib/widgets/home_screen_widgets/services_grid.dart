import 'package:flutter/material.dart';


class ServicesGrid extends StatelessWidget {
  const ServicesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 16 / 13,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        for (int i = 0; i < 9; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width / 3.8,
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
                child: Text("Bricolage", style: Theme.of(context).textTheme.bodySmall,),
              ),
            ],
          ),
      ],
    );
  }
}
