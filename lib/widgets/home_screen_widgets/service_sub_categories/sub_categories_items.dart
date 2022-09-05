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
    final mainCategoryIndex = routeArgs['index'];
    final mainCategoryId= routeArgs['mainId'];
    return ListTile(
      onTap: (){
        if(subCategory.id < 5) {
          Navigator.of(context)
              .pushNamed(MyRoutes.CHILDCATEGORYROUTE, arguments: {
            'subCategoryIndex': subCategory.id - 1,
            'mainCategoryIndex': mainCategoryIndex,
            'mainCategoryId': mainCategoryId,
            'subCategoryId': subCategory.id,
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
            case 10:
              {
                Navigator.of(context).pushNamed(MyRoutes.MAINTENANCEGREENSPACEROUTE);
              }
              break;
            case 11:
              {
                Navigator.of(context).pushNamed(MyRoutes.LAWNCAREROUTE);
              }
              break;
            case 12:
              {
                Navigator.of(context).pushNamed(MyRoutes.TERRACECLEANINGROUTE);
              }
              break;
            case 13:
              {
                Navigator.of(context).pushNamed(MyRoutes.GARDENINGJOBROUTE);
              }
              break;
            case 14:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGASSISTANCEROUTE);
              }
              break;
            case 15:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGFURNITUREROUTE);
              }
              break;
            case 16:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGAPPLIANCESROUTE);
              }
              break;
            case 17:
              {
                Navigator.of(context).pushNamed(MyRoutes.RIDCLUTTERROUTE);
              }
              break;
            case 18:
              {
                Navigator.of(context).pushNamed(MyRoutes.JOBREMOVALROUTE);
              }
              break;
            case 19:
              {
                Navigator.of(context).pushNamed(MyRoutes.FURNITUREDELIVERYROUTE);
              }
              break;
            case 20:
              {
                Navigator.of(context).pushNamed(MyRoutes.APPLIANCEDELIVERYROUTE);
              }
              break;
            case 21:
              {
                Navigator.of(context).pushNamed(MyRoutes.LETTERSDELIVERYROUTE);
              }
              break;
            case 22:
              {
                Navigator.of(context).pushNamed(MyRoutes.RACEDELIVERYROUTE);
              }
              break;
            case 23:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMECLEANINGROUTE);
              }
              break;
            case 24:
              {
                Navigator.of(context).pushNamed(MyRoutes.IRONINGROUTE);
              }
              break;
            case 25:
              {
                Navigator.of(context).pushNamed(MyRoutes.CARWASHROUTE);
              }
              break;
            case 26:
              {
                Navigator.of(context).pushNamed(MyRoutes.POOLWASHINGROUTE);
              }
              break;
            case 27:
              {
                Navigator.of(context).pushNamed(MyRoutes.WINDOWCLEANINGROUTE);
              }
              break;
            case 28:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEANINGJOBROUTE);
              }
              break;
            case 30:
              {
                Navigator.of(context).pushNamed(MyRoutes.DOGSITTERROUTE);
              }
              break;
            case 31:
              {
                Navigator.of(context).pushNamed(MyRoutes.KEEPCATROUTE);
              }
              break;
            case 32:
              {
                Navigator.of(context).pushNamed(MyRoutes.KEEPANIMALSROUTE);
              }
              break;
            case 33:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEANCOMPUTERROUTE);
              }
              break;
            case 34:
              {
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERCOURSESROUTE);
              }
              break;
            case 35:
              {
                Navigator.of(context).pushNamed(MyRoutes.INSTALLPRINTERROUTE);
              }
              break;
            case 36:
              {
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERJOBROUTE);
              }
              break;
            case 37:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMECAREROUTE);
              }
              break;
            case 38:
              {
                Navigator.of(context).pushNamed(MyRoutes.MEDICINEDELIVERYROUTE);
              }
              break;
            case 39:
              {
                Navigator.of(context).pushNamed(MyRoutes.DELIVERGROCERIESROUTE);
              }
              break;
            case 40:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMEDELIVERYROUTE);
              }
              break;
            case 41:
              {
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTRACEROUTE);
              }
              break;
            case 42:
              {
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTMEDICALAPPOINTMENTROUTE);
              }
              break;
            case 43:
              {
                Navigator.of(context).pushNamed(MyRoutes.PREPAREMEALROUTE);
              }
              break;
            case 44:
              {
                Navigator.of(context).pushNamed(MyRoutes.WAITERWAITRESSROUTE);
              }
              break;
            case 45:
              {
                Navigator.of(context).pushNamed(MyRoutes.SEWINGALTERATIONROUTE);
              }
              break;
            case 46:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE);
              }
              break;
            case 47:
              {
                Navigator.of(context).pushNamed(MyRoutes.ENGLISHROUTE);
              }
              break;
            case 48:
              {
                Navigator.of(context).pushNamed(MyRoutes.SPANISHROUTE);
              }
              break;
            case 49:
              {
                Navigator.of(context).pushNamed(MyRoutes.CREOLEROUTE);
              }
              break;
            case 50:
              {
                Navigator.of(context).pushNamed(MyRoutes.MATHEMATICALROUTE);
              }
              break;
            case 51:
              {
                Navigator.of(context).pushNamed(MyRoutes.STORYROUTE);
              }
              break;
            case 52:
              {
                Navigator.of(context).pushNamed(MyRoutes.GEOGRAPHYROUTE);
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
