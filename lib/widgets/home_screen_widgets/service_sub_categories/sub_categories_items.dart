import 'package:flutter/material.dart';

import '../../../helpers/routes.dart';
import '../../../models/categories_models/main_categories_model.dart';


class SubCategoriesItems extends StatelessWidget {
  final SubCategory subCategory;
  const SubCategoriesItems({Key? key, required this.subCategory,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mainCategoryId = routeArgs['id'];
    return ListTile(
      onTap: (){
        if(subCategory.id < 5) {
          Navigator.of(context)
              .pushNamed(MyRoutes.CHILDCATEGORYROUTE, arguments: {
            'subCategoryId': subCategory.id - 1,
            'mainCategoryId': mainCategoryId,
          });
        } else {
          var checkId = subCategory.id;
          switch(checkId) {
            case 5:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOWLAWNROUTE);
              }
              break;
            case 6:
              {
                Navigator.of(context).pushNamed(MyRoutes.HEDGETRIMMINGROUTE);
              }
              break;
            case 7:
              {
                Navigator.of(context).pushNamed(MyRoutes.CUTTREEROUTE);
              }
              break;
            case 8:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEARINGROUTE);
              }
              break;
            case 9:
              {
                Navigator.of(context).pushNamed(MyRoutes.WEEDINGROUTE);
              }
              break;
          }
        }
      },
      contentPadding: const EdgeInsets.only(
          left: 0.0, bottom: 10.0, top: 10.0, right: 0.0),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: Colors.green,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            '${MyRoutes.IMAGEURL}/${subCategory.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        subCategory.title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 20,),
    );
  }
}
