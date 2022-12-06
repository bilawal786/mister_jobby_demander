import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/preferences_provider/preferences_provider.dart';
import 'package:provider/provider.dart';

import '../../../helpers/routes.dart';
import '../../../models/categories_models/main_categories_model.dart';

class ChildCategoriesItems extends StatelessWidget {
  final int mainCategoryId;
  final int subCategoryId;
  final ChildCategory childCategory;
  const ChildCategoriesItems({Key? key, required this.childCategory, required this.mainCategoryId, required this.subCategoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefData = Provider.of<PreferencesProvider>(context, listen: false);
    final checkToken = prefData.token;
      return ListTile(
      onTap: () {
        var check = childCategory.id;
        switch (check) {
          case 1:
            {
              checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
              Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE, arguments: {
                'mainCategoryId' : mainCategoryId,
                'subCategoryId'  : subCategoryId,
                'childCategoryId' : childCategory.id,
                'childCategoryTitle': childCategory.title,
                'price': 0,
              });
              print("$check");
            }
            break;
          case 2: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
            break;
          case 3: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 4: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 5: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 6: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 7: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 8: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 9: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.FURNITUREREPAIRROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 10: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.SMALLREPAIRROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 11: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.FENCEINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 12: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.HOODINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 13: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.LANDSCAPINGHOODROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 14: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.ELECTRICALINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 15: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.BULBINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 16: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.LAMPINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 17: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.AUTOMATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 18: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.ACINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 19: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.PAINTINGINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 20: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.PARQUETINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 21: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.TILESINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 22: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.CARPETINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 23: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.COATWALLROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 24: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.LININGINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 25: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.WATERINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 26: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.FLUSHINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 27: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.FAUCETINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 28: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.SINKINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 29: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.WASHINGMACHINEROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 30: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.TOILETINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
          case 31: {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.SINKDRAINROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
                'price': 0,
            });
            print("$check");
          }
          break;
        }
      },
      contentPadding:
          const EdgeInsets.only(left: 0.0, bottom: 10.0, top: 10.0, right: 0.0),
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
            '${MyRoutes.IMAGEURL}/${childCategory.img}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        childCategory.title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
      ),
    );
  }
}
