import 'package:flutter/material.dart';

import '../../../helpers/routes.dart';
import '../../../models/categories_models/main_categories_model.dart';

class ChildCategoriesItems extends StatelessWidget {
  final ChildCategory childCategory;
  const ChildCategoriesItems({Key? key, required this.childCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        var check = childCategory.id;
        switch (check) {
          case 1:
            {
              Navigator.of(context).pushNamed(MyRoutes.ASSEMBLEFURNITUREROUTE);
              print("$check");
            }
            break;
          case 2: {
            Navigator.of(context).pushNamed(MyRoutes.DISASSEMBLEFURNITURESROUTE);
            print("$check");
          }
            break;
          case 3: {
            Navigator.of(context).pushNamed(MyRoutes.CURTAININSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 4: {
            Navigator.of(context).pushNamed(MyRoutes.FIXINGSHELVESROUTE);
            print("$check");
          }
          break;
          case 5: {
            Navigator.of(context).pushNamed(MyRoutes.HANGTVROUTE);
            print("$check");
          }
          break;
          case 6: {
            Navigator.of(context).pushNamed(MyRoutes.SHOWERINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 7: {
            Navigator.of(context).pushNamed(MyRoutes.HANGPICTREROUTE);
            print("$check");
          }
          break;
          case 8: {
            Navigator.of(context).pushNamed(MyRoutes.MIRRORINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 9: {
            Navigator.of(context).pushNamed(MyRoutes.FURNITUREREPAIRROUTE);
            print("$check");
          }
          break;
          case 10: {
            Navigator.of(context).pushNamed(MyRoutes.SMALLREPAIRROUTE);
            print("$check");
          }
          break;
          case 11: {
            Navigator.of(context).pushNamed(MyRoutes.FENCEINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 12: {
            Navigator.of(context).pushNamed(MyRoutes.HOODINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 13: {
            Navigator.of(context).pushNamed(MyRoutes.LANDSCAPINGHOODROUTE);
            print("$check");
          }
          break;
          case 14: {
            Navigator.of(context).pushNamed(MyRoutes.ELECTRICALINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 15: {
            Navigator.of(context).pushNamed(MyRoutes.BULBINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 16: {
            Navigator.of(context).pushNamed(MyRoutes.LAMPINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 17: {
            Navigator.of(context).pushNamed(MyRoutes.AUTOMATIONROUTE);
            print("$check");
          }
          break;
          case 18: {
            Navigator.of(context).pushNamed(MyRoutes.ACINSTALLATIONROUTE);
            print("$check");
          }
          break;
          case 19: {
            Navigator.of(context).pushNamed(MyRoutes.PAINTINGINSTALLATIOROUTE);
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
