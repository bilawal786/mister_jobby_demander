import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/providers/categories_provider/main_categories_provider.dart';
import 'package:provider/provider.dart';

class ServicesGrid extends StatefulWidget {
  const ServicesGrid({Key? key}) : super(key: key);

  @override
  State<ServicesGrid> createState() => _ServicesGridState();
}

class _ServicesGridState extends State<ServicesGrid> {

  var _isInit = true;
  var loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_isInit){
      Provider.of<MainCategoriesProvider>(context).getMainCategories();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractCategories = categoriesData.mainCategories;
    return extractCategories == null ? CircularProgressIndicator() : GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 16 / 13,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        for (int i = 0; i < extractCategories.length ; i++)
          Column(
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
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    extractCategories[i].title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
