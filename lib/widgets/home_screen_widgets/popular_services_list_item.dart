import 'package:flutter/material.dart';
import 'package:mister_jobby/models/categories_models/main_categories_model.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/preferences_provider/preferences_provider.dart';

class PopularServicesListItems extends StatelessWidget {
  final ChildCategory? childCategory;
  const PopularServicesListItems({Key? key, required this.childCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefData = Provider.of<PreferencesProvider>(context, listen: false);
    final checkToken = prefData.token;

    return GestureDetector(
        onTap: () {
      var check = childCategory!.id;
      var mainCategoryId = 1;
      var subCategoryId = 1;
      switch (check) {
        case 1:
          {
            checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
            Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE, arguments: {
              'mainCategoryId' : mainCategoryId,
              'subCategoryId'  : subCategoryId,
              'childCategoryId' : childCategory!.id,
              'childCategoryTitle': childCategory!.title,
            });
            print("$check");
          }
          break;
        case 2: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 3: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 4: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 5: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 6: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 7: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
        case 8: {
          checkToken == 'null' ? Navigator.of(context).pushNamed(MyRoutes.LOGINROUTE) :
          Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE, arguments: {
            'mainCategoryId' : mainCategoryId,
            'subCategoryId'  : subCategoryId,
            'childCategoryId' : childCategory!.id,
            'childCategoryTitle': childCategory!.title,
          });
          print("$check");
        }
        break;
      }},
      child: Padding(
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
                  "${MyRoutes.IMAGEURL}/${childCategory!.img}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: Text(
                childCategory!.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Price:",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "${childCategory!.price} €",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
