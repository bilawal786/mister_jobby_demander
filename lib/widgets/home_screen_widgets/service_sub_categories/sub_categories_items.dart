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
                Navigator.of(context).pushNamed(MyRoutes.MOWLAWNROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 6:
              {
                Navigator.of(context).pushNamed(MyRoutes.HEDGETRIMMINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 7:
              {
                Navigator.of(context).pushNamed(MyRoutes.CUTTREEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 8:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEARINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 9:
              {
                Navigator.of(context).pushNamed(MyRoutes.WEEDINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 10:
              {
                Navigator.of(context).pushNamed(MyRoutes.MAINTENANCEGREENSPACEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 11:
              {
                Navigator.of(context).pushNamed(MyRoutes.LAWNCAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 12:
              {
                Navigator.of(context).pushNamed(MyRoutes.TERRACECLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 13:
              {
                Navigator.of(context).pushNamed(MyRoutes.GARDENINGJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 14:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGASSISTANCEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 15:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGFURNITUREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 16:
              {
                Navigator.of(context).pushNamed(MyRoutes.MOVINGAPPLIANCESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 17:
              {
                Navigator.of(context).pushNamed(MyRoutes.RIDCLUTTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 18:
              {
                Navigator.of(context).pushNamed(MyRoutes.JOBREMOVALROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 19:
              {
                Navigator.of(context).pushNamed(MyRoutes.FURNITUREDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 20:
              {
                Navigator.of(context).pushNamed(MyRoutes.APPLIANCEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 21:
              {
                Navigator.of(context).pushNamed(MyRoutes.LETTERSDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 22:
              {
                Navigator.of(context).pushNamed(MyRoutes.RACEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 23:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMECLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 24:
              {
                Navigator.of(context).pushNamed(MyRoutes.IRONINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 25:
              {
                Navigator.of(context).pushNamed(MyRoutes.CARWASHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 26:
              {
                Navigator.of(context).pushNamed(MyRoutes.POOLWASHINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 27:
              {
                Navigator.of(context).pushNamed(MyRoutes.WINDOWCLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 28:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEANINGJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 29:
              {
                Navigator.of(context).pushNamed(MyRoutes.CHILDCAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 30:
              {
                Navigator.of(context).pushNamed(MyRoutes.DOGSITTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 31:
              {
                Navigator.of(context).pushNamed(MyRoutes.KEEPCATROUTE, arguments: {
                'mainCategoryId': mainCategoryId,
                'subCategoryId': subCategory.id,
                'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 32:
              {
                Navigator.of(context).pushNamed(MyRoutes.KEEPANIMALSROUTE , arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 33:
              {
                Navigator.of(context).pushNamed(MyRoutes.CLEANCOMPUTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 34:
              {
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERCOURSESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 35:
              {
                Navigator.of(context).pushNamed(MyRoutes.INSTALLPRINTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 36:
              {
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 37:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMECAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 38:
              {
                Navigator.of(context).pushNamed(MyRoutes.MEDICINEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 39:
              {
                Navigator.of(context).pushNamed(MyRoutes.DELIVERGROCERIESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 40:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 41:
              {
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTRACEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 42:
              {
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTMEDICALAPPOINTMENTROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 43:
              {
                Navigator.of(context).pushNamed(MyRoutes.PREPAREMEALROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 44:
              {
                Navigator.of(context).pushNamed(MyRoutes.WAITERWAITRESSROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 45:
              {
                Navigator.of(context).pushNamed(MyRoutes.SEWINGALTERATIONROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 46:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 47:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 48:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 49:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 50:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 51:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 52:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 53:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 54:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 55:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 56:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 57:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 58:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 59:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 60:
              {
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 61:
              {
                Navigator.of(context).pushNamed(MyRoutes.PHOTOGRAPHYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 62:
              {
                Navigator.of(context).pushNamed(MyRoutes.HOMECHEFROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 63:
              {
                Navigator.of(context).pushNamed(MyRoutes.BARTENDERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 64:
              {
                Navigator.of(context).pushNamed(MyRoutes.WAITERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 65:
              {
                Navigator.of(context).pushNamed(MyRoutes.DJROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 66:
              {
                Navigator.of(context).pushNamed(MyRoutes.ANIMATORROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 67:
              {
                Navigator.of(context).pushNamed(MyRoutes.FLYERSDISTRIBUTIONROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 68:
            {
              Navigator.of(context).pushNamed(MyRoutes.HOSTHOTESSROUTE, arguments: {
                'mainCategoryId': mainCategoryId,
                'subCategoryId': subCategory.id,
                'subCategoryTitle': subCategory.title,
              });
            }
            break;
            case 69:
              {
                Navigator.of(context).pushNamed(MyRoutes.ADMINISTRAVTIVETASKROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 70:
              {
                Navigator.of(context).pushNamed(MyRoutes.VEHICLEMAINTENANCEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 71:
              {
                Navigator.of(context).pushNamed(MyRoutes.VEHICLEREPAIRROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 72:
              {
                Navigator.of(context).pushNamed(MyRoutes.TROUBLESHOOTINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
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
