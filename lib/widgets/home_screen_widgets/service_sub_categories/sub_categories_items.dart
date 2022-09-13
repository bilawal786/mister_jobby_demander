import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/preferences_provider/preferences_provider.dart';
import 'package:provider/provider.dart';

import '../../../helpers/routes.dart';
import '../../../models/categories_models/main_categories_model.dart';


class SubCategoriesItems extends StatelessWidget {
  final SubCategory subCategory;
  const SubCategoriesItems({Key? key, required this.subCategory,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefData = Provider.of<PreferencesProvider>(context, listen: false);
    final checkToken = prefData.token;
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
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MOWLAWNROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 6:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.HEDGETRIMMINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 7:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CUTTREEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 8:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CLEARINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 9:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.WEEDINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 10:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MAINTENANCEGREENSPACEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 11:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.LAWNCAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 12:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.TERRACECLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 13:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.GARDENINGJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 14:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MOVINGASSISTANCEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 15:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MOVINGFURNITUREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 16:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MOVINGAPPLIANCESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 17:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.RIDCLUTTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 18:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.JOBREMOVALROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 19:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FURNITUREDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 20:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.APPLIANCEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 21:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.LETTERSDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 22:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.RACEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 23:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.HOMECLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 24:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.IRONINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 25:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CARWASHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 26:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.POOLWASHINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 27:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.WINDOWCLEANINGROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 28:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CLEANINGJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 29:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CHILDCAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 30:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.DOGSITTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 31:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.KEEPCATROUTE, arguments: {
                'mainCategoryId': mainCategoryId,
                'subCategoryId': subCategory.id,
                'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 32:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.KEEPANIMALSROUTE , arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 33:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.CLEANCOMPUTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 34:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERCOURSESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 35:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.INSTALLPRINTERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 36:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.COMPUTERJOBROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 37:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.HOMECAREROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 38:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.MEDICINEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 39:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.DELIVERGROCERIESROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 40:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.HOMEDELIVERYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 41:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTRACEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 42:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.ACCOMPANIMENTMEDICALAPPOINTMENTROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 43:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.PREPAREMEALROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 44:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.WAITERWAITRESSROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 45:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.SEWINGALTERATIONROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 46:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 47:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 48:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 49:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 50:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 51:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 52:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 53:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 54:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 55:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 56:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 57:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 58:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 59:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 60:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FRENCHROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 61:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.PHOTOGRAPHYROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 62:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.HOMECHEFROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 63:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.BARTENDERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 64:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.WAITERROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 65:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.DJROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 66:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.ANIMATORROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 67:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.FLYERSDISTRIBUTIONROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 68:
            {
              prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
              Navigator.of(context).pushNamed(MyRoutes.HOSTHOTESSROUTE, arguments: {
                'mainCategoryId': mainCategoryId,
                'subCategoryId': subCategory.id,
                'subCategoryTitle': subCategory.title,
              });
            }
            break;
            case 69:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.ADMINISTRAVTIVETASKROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 70:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.VEHICLEMAINTENANCEROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 71:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
                Navigator.of(context).pushNamed(MyRoutes.VEHICLEREPAIRROUTE, arguments: {
                  'mainCategoryId': mainCategoryId,
                  'subCategoryId': subCategory.id,
                  'subCategoryTitle': subCategory.title,
                });
              }
              break;
            case 72:
              {
                prefData.token == 'null'? Navigator.of(context).pushNamed(MyRoutes.HOMETABROUTE):
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
