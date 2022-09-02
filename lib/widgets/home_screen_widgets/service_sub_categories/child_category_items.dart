import 'package:flutter/material.dart';

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
      return ListTile(
      onTap: () {
        var check = childCategory.id;
        switch (check) {
          case 1:
            {
              Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE, arguments: {
                'mainCategoryId' : mainCategoryId,
                'subCategoryId'  : subCategoryId,
                'childCategoryId' : childCategory.id,
                'childCategoryTitle': childCategory.title,
              });
              print("$check");
            }
            break;
          case 2: {
            Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
            break;
          case 3: {
            Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 4: {
            Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 5: {
            Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 6: {
            Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 7: {
            Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 8: {
            Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 9: {
            Navigator.of(context).pushNamed(MyRoutes.FURNITUREREPAIRROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 10: {
            Navigator.of(context).pushNamed(MyRoutes.SMALLREPAIRROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 11: {
            Navigator.of(context).pushNamed(MyRoutes.FENCEINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 12: {
            Navigator.of(context).pushNamed(MyRoutes.HOODINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 13: {
            Navigator.of(context).pushNamed(MyRoutes.LANDSCAPINGHOODROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 14: {
            Navigator.of(context).pushNamed(MyRoutes.ELECTRICALINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 15: {
            Navigator.of(context).pushNamed(MyRoutes.BULBINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 16: {
            Navigator.of(context).pushNamed(MyRoutes.LAMPINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 17: {
            Navigator.of(context).pushNamed(MyRoutes.AUTOMATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 18: {
            Navigator.of(context).pushNamed(MyRoutes.ACINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 19: {
            Navigator.of(context).pushNamed(MyRoutes.PAINTINGINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 20: {
            Navigator.of(context).pushNamed(MyRoutes.PARQUETINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 21: {
            Navigator.of(context).pushNamed(MyRoutes.TILESINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 22: {
            Navigator.of(context).pushNamed(MyRoutes.CARPETINSTALLATIOROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 23: {
            Navigator.of(context).pushNamed(MyRoutes.COATWALLROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 24: {
            Navigator.of(context).pushNamed(MyRoutes.LININGINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 25: {
            Navigator.of(context).pushNamed(MyRoutes.WATERINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 26: {
            Navigator.of(context).pushNamed(MyRoutes.FLUSHINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 27: {
            Navigator.of(context).pushNamed(MyRoutes.FAUCETINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 28: {
            Navigator.of(context).pushNamed(MyRoutes.SINKINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 29: {
            Navigator.of(context).pushNamed(MyRoutes.WASHINGMACHINEROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 30: {
            Navigator.of(context).pushNamed(MyRoutes.TOILETINSTALLATIONROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
            });
            print("$check");
          }
          break;
          case 31: {
            Navigator.of(context).pushNamed(MyRoutes.SINKDRAINROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory.id,
              'childCategoryTitle': childCategory.title,
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
