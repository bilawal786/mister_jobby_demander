import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/categories_provider/main_categories_provider.dart';
import '../../providers/preferences_provider/preferences_provider.dart';

class ServicesGrid extends StatefulWidget {
  const ServicesGrid({Key? key}) : super(key: key);

  @override
  State<ServicesGrid> createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {
  var isInit = true;

  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<PreferencesProvider>(context, listen: false).checkToken();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractCategories = categoriesData.mainCategories;
    return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 16 / 15,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              for (int i = 0; i < extractCategories!.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MyRoutes.SUBCATEGORYROUTE,
                      arguments: {
                        'index': i,
                        'mainId': extractCategories[i].id,
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            '${MyRoutes.IMAGEURL}/${extractCategories[i].image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          extractCategories[i].title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cerebri Sans Bold',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
